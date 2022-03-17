class SuperFansController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        super_fans = SuperFan.all
        render json: super_fans
    end

    def destroy
        super_fan = find_super_fan
        super_fan.destroy
        head :no_content
    end

    private

    def find_super_fan
      SuperFan.find(params[:id])  
    end

    def render_not_found_response
        render json: { error: "Superfan not found " }, status: :not_found
    end

end








