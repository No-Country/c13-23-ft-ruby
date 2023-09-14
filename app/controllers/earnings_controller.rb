class EarningsController < ApplicationController
    # before_action :set_movement, only: %i[index]
  
    def index
      @bussines = Business.find(params[:business_id])
      @accounts = @bussines.accounts
      @earnings = []
      @accounts.map do |account|
        account.movements.map do |movement|
          @earnings.push(movement) if movement.beneficiary == 'Ingreso'
        end
      end        
    end
    
      private
    
      # def set_movement
      #   @movement = Movement.find(params[:movement_id])
      # end
  end
  