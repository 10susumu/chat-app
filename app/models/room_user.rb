class RoomUser < ApplicationRecord
  belongs_to :room
  delongs_to :user
end
