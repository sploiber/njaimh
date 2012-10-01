class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # removed :confirmable, :trackable, :recoverable, :registerable  on 10/1/2012
  devise :database_authenticatable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
