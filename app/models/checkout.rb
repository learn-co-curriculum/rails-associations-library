class Checkout < ActiveRecord::Base
  belongs_to :book
  belongs_to :reader, :class_name => "Member"
end
