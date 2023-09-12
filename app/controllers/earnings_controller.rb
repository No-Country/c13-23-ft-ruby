class EarningsController < ApplicationController
    before_action :set_movement, only: %i[index]
  
    def index
        @earnings = @movement.earning
      end
    
      private
    
      def set_movement
        @movement = Movement.find(params[:movement_id])
      end
  end
  