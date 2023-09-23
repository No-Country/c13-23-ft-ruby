class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]
  
  def index
    @accounts = Account.where(business_id: current_user)
  end

  def show
    @account = Account.find(params[:id])
    @business = @account.business
  end

  def new
    @business = Business.find(params[:business_id])
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.business_id = params[:business_id]
    if @account.save
      redirect_to business_path(@account.business_id)
    else
      render :new
    end
  end

  def edit
    @business = @account.business
    @account = Account.find(params[:id])
  end

  def update
    @business = Business.find(params[:business_id])
    @account = Account.find(params[:id])
  
    if @account.update(account_params)
      redirect_to business_path(@account.business_id)
    else
      render :edit
    end
  end
  
  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:business_id, :name, :balance)
  end
end