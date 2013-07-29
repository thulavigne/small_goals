class Step < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  attr_accessible :name
  validates :name, :presence => true
end
