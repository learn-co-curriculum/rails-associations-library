class Member < ActiveRecord::Base
  belongs_to :county
  has_many :checkouts, :foreign_key => 'reader_id'
  has_many :books, :through => :checkouts
  has_many :county_memberships
  has_many :counties, through: :county_memberships
end
