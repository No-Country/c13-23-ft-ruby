class TransfersController < ApplicationController
    # before_action :set_movement
  
    def index
      @business = Business.find(params[:business_id])
      @accounts = @bussines.accounts
      @transfers = []
      @accounts.map do |account|
        account.movements.map do |movement|
          @transfers.push(movement) if movement.beneficiary == 'Transferencia'
        end
      end        
    end

    def new
      @bussines = Business.find(params[:business_id])
      @accounts = @bussines.accounts
    end
  
    def create
      @transfer = Transfer.new(transfer_params)

      if @transfer.save
        redirect_to transfer_path(@transfer), notice: 'Transferencia creada exitosamente.'
      else
        render :new
      end
    end

    private
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    def transfer_params
      params.require(:transfer).permit(:movements_id)
    end
  
    def set_transfer_movement
      @movement = Movement.find(params[:movement_id])
    end
  end