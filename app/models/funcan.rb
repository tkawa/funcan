class Funcan < ActiveRecord::Base
  has_many :comments
  has_many :likes; has_many :wants; has_many :greats; has_many :interestings
  validates :sid, uniqueness: true
end
