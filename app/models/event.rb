class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :address, :city, :state
end
