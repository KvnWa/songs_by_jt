class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_with_unprocessable_entity

def create
    review = Review.create!(review_params)
    render json: review, status: :created
end

private

def review_params
    params.permit(:song_id, :super_fan_id, :rating, :comment)
end

def render_with_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
end
   
end
