class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.find_by(username: params['username']).try(:authenticate, params['password'])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Username or password are incorrect!"
      render 'new';
    end
  end

end