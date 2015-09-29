class County < ActiveRecord::Base
  has_many :libraries
  has_many :members
end
