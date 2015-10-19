class County < ActiveRecord::Base
  has_many :libraries
  has_many :county_memberships
  has_many :members, through: :county_memberships
end
