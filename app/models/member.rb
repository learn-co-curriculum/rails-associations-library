class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships
end
