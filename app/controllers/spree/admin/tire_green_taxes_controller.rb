module Spree
  module Admin
    class TireGreenTaxesController < ResourceController

      def index
        params[:q] ||= {}
        params[:q] ||= "cat asc"
        @search = Spree::TireGreenTax.ransack(params[:q])
        @tire_green_taxis = @search.result.page(params[:page]).per(10)
      end

    end
  end
end 