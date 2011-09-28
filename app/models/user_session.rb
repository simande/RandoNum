class UserSession < ActiveRecord::Base
  attr_accessor :password, :user_id
  
  validate :check_password
  
  def check_password
    if !self.email.blank? && !self.password.blank?
      @user = User.where("email = ?", self.email).first
      if @user
        hashed_password = Digest::SHA1.hexdigest(@user.salt + self.password + 'histaticsalt')
        if hashed_password == @user.hashed_password
          self.user_id = @user.id
          return true
        end
      end
    end
    errors.add(:base, "Incorrect email and/or password.")
  end
end