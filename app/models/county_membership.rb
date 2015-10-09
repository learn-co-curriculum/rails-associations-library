class CountyMembership < ActiveRecord::Base
  belongs_to :county
  belongs_to :member
end
