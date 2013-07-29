class Step < ActiveRecord::Base
  belongs_to :goal
  attr_accessible :name
  validates :name, :presence => true
end
