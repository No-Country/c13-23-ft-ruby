class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show edit update destroy]

  def index
    @businesses = Business.where(user_id: current_user.id)
  end

  def show
    @accounts = @business.accounts
    @bussines = Business.find(params[:id])
    @movements = []
    @accounts.map do |account|
      account.movements.map do |movement|
        @movements.push(movement)
      end
    end  
  end

  def new
    @business = Business.new
    set_user_business
  end

  def create
    @business = Business.new(business_params)
    set_user_business
    if @business.save
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @business.update(business_params)
      redirect_to @business
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to businesses_path
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def set_user_business
    @business.user = current_user
  end

  def business_params
    params.require(:business).permit(:user_id, :name_business, :description, :logo)
  end
end
