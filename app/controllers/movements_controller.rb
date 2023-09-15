class MovementsController < ApplicationController
    before_action :set_account, only: %i[create edit update destroy]
  

    def index
      @business = Business.find(params[:business_id])
      @user = current_user

      @accounts = @business.accounts
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
      @movement = Movement.new(movement_params)
      @account = Account.find(@movement.account_id)
      if @movement.save
        if movement_params[:beneficiary] == 'Ingreso'
          @account.balance_cents += @movement.balance_cents
          @account.save
          redirect_to business_earnings_path
        elsif movement_params[:beneficiary] == 'Egreso'
          @account.balance_cents -= @movement.balance_cents
          @account.save
          redirect_to business_egresses_path
        elsif movement_params[:beneficiary] == 'Transferencia'
          @account.balance_cents -= @movement.balance_cents
          @account.save
          redirect_to business_transfers_path
        end
      else
        render new
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
  