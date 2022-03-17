class TopChartSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_reviews, :average_rating

  def total_reviews
    song = Song.all.map { |s| s.reviews.count }.max
end

def average_rating
    song = Song.all.max_by { |s| s.reviews.count }
    song.reviews.average(:rating)
end
  
end
