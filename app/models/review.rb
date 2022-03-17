class Review < ApplicationRecord
    belongs_to :song
    belongs_to :super_fan

    validates :rating, inclusion: 1..10
    validates :super_fan_id, uniqueness: {scope: :song_id, message: "already left a review for this song"}
end
