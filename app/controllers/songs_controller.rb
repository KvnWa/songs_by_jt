class SongsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        songs = Song.all 
        render json: songs
    end

    def show
        song = Song.find(params[:id])
        render json: song
    end

    def top_charts
        song = Song.all.max_by { |s| s.reviews.count }
        render json: song, Serializer: TopChartSerializer
    end

    

    private

    def render_not_found_response
        render json: { error: "Song not found" }, status: :not_found
    end
end
