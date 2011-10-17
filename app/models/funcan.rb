class Funcan < ActiveRecord::Base
  has_many :comments
  validates :sid, uniqueness: true
end
