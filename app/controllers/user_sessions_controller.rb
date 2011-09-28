class UserSessionsController < ApplicationController
  def new
    @user = User.new
    @user_session = UserSession.new()
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.valid?
      session[:uid] = @user_session.id
      n = Number.latest
      redirect_to '/is/' + n.to_s
    else
      @user = User.new
      flash[:notice] = "Invalid email and/or password."
      render :new
    end
  end
end