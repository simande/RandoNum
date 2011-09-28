class Number < ActiveRecord::Base
  def self.latest
    number = Number.where("DATE(created_at) = DATE(?)", Time.now).first
    if number
      return number.is
    else
      Number.create(:is => Random.rand(99999)).is
    end
  end
end
