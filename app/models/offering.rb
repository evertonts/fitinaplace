class Offering < ActiveRecord::Base
  has_many :negociation, :dependent => :destroy
  belongs_to :event
  validates_presence_of :price, :resource_id
  has_many :questions
end
