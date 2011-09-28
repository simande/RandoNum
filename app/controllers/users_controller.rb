class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to('/is')
    else
      redirect_to '/', notice: @user.errors.full_messages.join(", ")
    end
  end
end