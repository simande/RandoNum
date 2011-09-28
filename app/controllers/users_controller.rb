class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:uid] = @user.id
      n = Number.latest
      redirect_to '/is/' + n.to_s
    else
      redirect_to '/', notice: @user.errors.full_messages.join(", ")
    end
  end
end