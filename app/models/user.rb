class User < ApplicationRecord
  extend SerializedHashReaderWriter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users

  def roles?(project_id, role)
    project_roles.where(project_id: project_id).first.roles.any? { |r| r.underscore.to_sym == role }
  end

  # def self.permissions
  #   [
  #     :site,
  #     :advertiser,
  #     :affiliate_network,
  #     :article,
  #     :author,
  #     :campaign_group,
  #     :campaign,
  #     :campaign_bid,
  #     # :lander,
  #     :metatags,
  #     :product_reward,
  #     :pixel,
  #     :product,
  #     :publisher,
  #     :report,
  #     :user,
  #     :revenue_certainty,
  #     :analyzed_keyword,
  #     :admin_api,
  #     :redirect_rule
  #   ]
  # end
  #
  # serialize :permissions, HashWithIndifferentAccess
  # serialized_attr_accessible_structure :permissions, *User.permissions

  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_auth_token
    end
  end

  private

    def generate_auth_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end

end
