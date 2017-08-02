class Project < ApplicationRecord

  has_many :project_users
  has_many :users, through: :project_users

  has_many :accounts
  accepts_nested_attributes_for :users, :accounts, :project_users

  has_many :bid_managements, foreign_key: :site_id

end
