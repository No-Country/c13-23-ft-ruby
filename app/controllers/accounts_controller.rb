class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]
  def index
    @accounts = Account.where(business_id: current_user)
  end

  def show
    @accounts = Account.where(business_id: current_user)
  end

  def new
    @account = Account.new
  end

  def create
    @business = current_user.businesses
    @account = Account.new(account_params)
    if @account.save
      redirect_to business_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @account.update(account_params)
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to businesses_path
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:business_id, :name, :balance_cents)
  end
end