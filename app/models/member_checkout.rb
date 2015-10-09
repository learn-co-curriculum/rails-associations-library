class MemberCheckout < ActiveRecord::Base
  belongs_to :member
  belongs_to :checkout
end
