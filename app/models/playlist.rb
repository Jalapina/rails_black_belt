class Playlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  has_many :songs, dependent: :destroy
  has_many :users
end
