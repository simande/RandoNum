class User < ActiveRecord::Base
  attr_accessor :password
  
  validates :email, :uniqueness => true, :format => /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
  validates :password, :presence => true
  before_create :generate_hashed_password
  
  def generate_hashed_password
    self.salt = (0...30).map{65.+(rand(25)).chr}.join
    self.hashed_password = Digest::SHA1.hexdigest(salt + self.password + 'histaticsalt')
  end
end