class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/'
  end

end
