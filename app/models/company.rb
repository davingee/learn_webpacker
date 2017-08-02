class Company < ApplicationRecord

  has_many :users
  has_many :projects

  accepts_nested_attributes_for :users, :projects

end
