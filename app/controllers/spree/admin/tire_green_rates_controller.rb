module Spree
  module Admin
    class TireGreenRatesController < ResourceController

      def index
        params[:q] ||= {}
        params[:q] ||= "cat asc"
        @search = Spree::TireGreenRate.ransack(params[:q])
        @tire_green_rates = @search.result.page(params[:page]).per(10)
      end
    end
  end
end 
