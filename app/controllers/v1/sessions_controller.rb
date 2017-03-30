class V1::SessionsController < ApplicationController
  skip_before_action :authenticate
  def create
    account = Account.authenticate(account_params[:username], account_params[:password])
    if account
      render json: {jwt: Auth.encode(account_id: account.id)}
    else
      render json: {error: "Bad Username or Password"}, status: 401
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end
end
