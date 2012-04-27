class Offering < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :price, :space_id
end
