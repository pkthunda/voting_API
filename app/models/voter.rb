class Voter < ActiveRecord::Base
  has_many :votes
  validates :name, uniquness: true


end
