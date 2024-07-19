module Api
  module V1
    class SeatsController < ApplicationController
      def show
        render json: [seat_params[:from_station], seat_params[:to_station]]
      end

      private def seat_params
        # debugger
        params.permit(:from_station, :to_station)
      end
    end
  end
end