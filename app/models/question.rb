class Question < ActiveRecord::Base
  belongs_to :offering
  validates_presence_of :text
end