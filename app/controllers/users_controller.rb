class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:uid] = @user.id
      n = Number.latest
      redirect_to '/is/' + n.to_s
    else
      render :new
    end
  end
end