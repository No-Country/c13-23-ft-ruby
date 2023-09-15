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

  def new
    # @egress = Egress.new
    @business = Business.find(params[:business_id])
    @accounts = @business.accounts
    @categorias = Movement.categorias_ingresos.keys.map { |categoria| [categoria, categoria]}
  end




  # def set_movement
  # @movement = Movement.find(params[:movement_id])
  # end

end