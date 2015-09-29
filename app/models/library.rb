class Library < ActiveRecord::Base
  belongs_to :country
  has_many :books
end
