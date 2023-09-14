class MovementsController < ApplicationController
    before_action :set_account, only: %i[create edit update destroy]
  

    def index
      @bussines = Business.find(params[:business_id])
      @user = current_user

      @accounts = @bussines.accounts
      @movements = []
      @accounts.map do |account|
        account.movements.map do |movement|
          @movements.push(movement)
        end
      end  
      
    end

    def new
      @movement = Movement.new
      set_account
    end
  
    def create
      @movement = @account.movements.new(movement_params)
      if @movement.save
        case @movement.beneficiary
        when 'Egreso'
          Egress.create(movements_id: @movement.id) if @movement.balance.negative?
        when 'Ingreso'
          Earning.create(movements_id: @movement.id) unless @movement.balance.negative?
        when 'Transferencia'
          Transfer.create(movements_id: @movement.id)
        end
        redirect_to @account, notice: 'Movimiento creado exitosamente.'
      else
        render :new
      end
    end
  

  def edit; end
  
  def update
    if @movement.update(movement_params)
      redirect_to @movement, notice: 'Movimiento actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @movement.destroy
    redirect_to movements_path
  end

  private

  def set_account
    @account = Account.find(movement_params[:account_id])
  end

  # def set_movement
  #   @movement = Movement.find(params[:id])
  # end

  def movement_params
    params.require(:movement).permit(:balance_cents, :category, :beneficiary, :note, :created_at, :account_id)
  end
end
  