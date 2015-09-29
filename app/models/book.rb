class Book < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :author
  belongs_to :genre
  belongs_to :topic
  
  belongs_to :library
  delegate :county, to: :library

  has_many :checkouts
  has_many :readers, :through => :checkouts
end
=======
end
>>>>>>> model test for name and description attribute for books table
