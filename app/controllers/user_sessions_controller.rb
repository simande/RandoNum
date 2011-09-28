class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new()
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      session[:uid] = @user_session.id
      n = Number.latest
      redirect_to '/is/' + n.to_s
    else
      render :new
    end
  end
  
  def destroy
    session[:uid] = nil
    redirect_to '/signin'
  end
end