class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album

  validates :title, presence: true
  validates :time, presence: true
end
