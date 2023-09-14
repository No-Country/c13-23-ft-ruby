class NotificationsController < ApplicationController
  before_action :set_business

    def index

    end

    def new

    end
  
    def create

    end
  

  def edit; end
  
  def update

  end

  def destroy
    @notification.destroy
    redirect_to movements_path
  end

  private

  def set_business
    @business = Business.find(notification_params[:business_id])
  end

  def notification_params
    params.require(:movement).permit(:name, :date, :status, :balance_cents, :note, :created_at, :updated_at, :business_id)
  end
end
  
