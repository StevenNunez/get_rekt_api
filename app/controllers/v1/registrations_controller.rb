class V1::RegistrationsController < ApplicationController
  skip_before_action :authenticate
  def create
    account = Account.new(account_params)
    if account.save
      render json: {jwt: Auth.encode(account_id: account.id)}
    else
      render json: {errors: account.errors}, status: 401
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end
end
