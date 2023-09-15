class EgressesController < ApplicationController
    # before_action :set_movement, only: %i[index]
  
    def index
      @bussines = Business.find(params[:business_id])
      @accounts = @bussines.accounts
      @egresses = []
      @accounts.map do |account|
        account.movements.map do |movement|
          @egresses.push(movement) if movement.beneficiary == 'Egreso'
        end
      end        
    end

    def new
      # @egress = Egress.new
      @business = Business.find(params[:business_id])
      @accounts = @business.accounts
    end
    
  
    # private

    # def set_movement
    #     @movement = Movement.find(params[:movement_id])
    # end
  end
  