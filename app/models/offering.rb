class Offering < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :price, :id_space
end