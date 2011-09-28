class NumbersController < ApplicationController
  def index
    @number = Number.latest
  end
end