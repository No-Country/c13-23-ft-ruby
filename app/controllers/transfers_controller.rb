class TransfersController < ApplicationController
    # before_action :set_movement
  
    def index
      @bussines = Business.find(params[:business_id])
      @accounts = @bussines.accounts
      @transfers = []
      @accounts.map do |account|
        account.movements.map do |movement|
          @earnings.push(movement) if movement.beneficiary == 'Transferencia'
        end
      end        
    end
  
    private
  
    # def set_movement
    #   @movement = Movement.find(params[:movement_id])
    # end
  end