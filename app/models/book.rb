class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre
  belongs_to :topic

  belongs_to :library
  delegate :county, to: :library

  has_many :checkouts
  has_many :readers, :through => :checkouts
end
