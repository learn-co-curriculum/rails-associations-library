class Member < ActiveRecord::Base
  has_many :county_memberships
  has_many :counties, through: :county_memberships

  has_many :libraries, through: :counties
  has_many :books, through: :libraries
  has_many :checkouts, through: :books
end
