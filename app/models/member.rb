class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships
  has_many :libraries, through: :counties

  has_many :member_checkouts
  has_many :checkouts, through: :member_checkouts
  has_many :books, through: :checkouts
end
