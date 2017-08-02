class ProjectUser < ApplicationRecord

  belongs_to :project
  belongs_to :user

  validates :roles, :inclusion=> { :in => [ :manage, :list, :show, :update, :destroy ] }

  serialize :roles, Array

end
