class NumbersController < ApplicationController
  def index
    @number = Number.latest
    @users = User.select("email, num_logins").order("num_logins DESC")
  end
end