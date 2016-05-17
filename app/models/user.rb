class User < ActiveRecord::Base

# hey add some associations!

  validates     :email, { :presence => true}
  validates     :email, { :uniqueness => true }
  validate      :validate_password

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(password_from_user)
    @password_from_user = password_from_user
    @password = BCrypt::Password.create(password_from_user)
    self.hashed_password = @password
  end

  def authenticate(password)
    @user = User.find_by(email: email)

    if @user == nil then return nil end

    if @user.password == password
      return @user
    else
      return nil
    end
  end

  def validate_password
    if @password_from_user.length == 0
      self.errors.add(:password, "was not provided")
    end
  end

end
