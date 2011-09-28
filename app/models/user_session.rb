class UserSession
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :email, :password, :id
  
  validate :check_password
  
  def check_password
    if !self.email.blank? && !self.password.blank?
      @user = User.where("email = ?", self.email).first
      if @user
        hashed_password = Digest::SHA1.hexdigest(@user.salt + self.password + 'histaticsalt')
        if hashed_password == @user.hashed_password
          self.id = @user.id
          return true
        end
      end
    end
    errors.add(:base, "Incorrect email and/or password.")
  end

  class << self
    def all
      return []
    end
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end