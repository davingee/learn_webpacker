class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  before_save :ensure_authentication_token

  def ensure_authentication_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end

end
