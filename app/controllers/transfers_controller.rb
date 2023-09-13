class TransfersController < ApplicationController
    before_action :set_movement
  
    def index
      @transfers = @movement.transfer
    end
  
    private
  
    def set_movement
      @movement = Movement.find(params[:movement_id])
    end
  end