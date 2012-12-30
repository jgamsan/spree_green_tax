require_dependency 'spree/calculator'

module Spree
  class Calculator::TireGreenRate < Calculator
    def self.description
      I18n.t(:green_rate)
    end

    def find_green_rate(variant)
      # calculate the tax rate based on order billing location
      # the rate will be calculated:
      # 1) by querying the spree_local_taxes DB for a county + state match
      # 1) by querying the spree_local_taxes DB for a zip match
      # 2) by falling back to the rate.amount

      # TODO the idea here is to provide multiple backends to use to calculate taxes
      # the first (and easiest + most reliable for my use case) is SQL / CSV data
      # other options
      # http://developer.avalara.com/
      # https://taxcloud.net/default.aspx

      # assumes SQL backend for now

      # NOTE the zip code match is only based on the first five digits

      Spree::TireGreenRate.find(variant.tire_green_rate_id)
    end

    def taxable_amount(order)
      # item total + shipping - promotions

      possible_adjustments = order.adjustments.eligible

      adjustment_totals = (
        possible_adjustments.shipping +
        possible_adjustments.promotion
      ).map(&:amount).sum

      line_items_total = order.line_items.select do |line_item|
        line_item.product.tax_category == rate.tax_category
      end.sum(&:total)

      line_items_total + adjustment_totals
    end

    private

      def compute_order(order)
        green_rate = 0
        order.line_items.each do |item|
          green_rate += item.variant.tire_green_rate.amount
        end
        # TODO the only issue here is that the label text for the adjustment is not calculated
        # based on the rate method here, the TaxRate.amount is used instead
        # need to modify https://github.com/spree/spree/blob/master/core/app/models/spree/tax_rate.rb#L47

        round_to_two_places(green_rate)
      end

  end
end