class SessionController < ApplicationController
  def new
  end

  def create
    # Login (create session)
    user = User.find_by(email: params[:session][:email].downcase)
    # byebug
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Login in succesful"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details."
      render 'new'
    end
  end

  def destroy
    # Logout (destroy session)
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
