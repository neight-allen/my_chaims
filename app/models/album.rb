class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist

  validates :year, presence: true
  validates :title, presence: true
end
