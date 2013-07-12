require_dependency 'spree/calculator'

module Spree
  class Calculator::VariableRate < Calculator
    preference :amount, :decimal, :default => 0
    preference :max_amount, :decimal, :default => 0
    preference :currency, :string, :default => Spree::Config[:currency]

    attr_accessible :preferred_amount, :preferred_max_amount, :preferred_currency

    def self.description
      I18n.t(:variable_rate_per_total)
    end

    def compute(object)
<<<<<<< HEAD
      if object.total > preferred_max_amount
        0
=======
      return unless object.present? and object.line_items.present?
      item_total = object.line_items.map(&:amount).sum
      if item_total >= preferred_max_amount
        0.0
>>>>>>> 50d9f0025af25aae28b4b556ac5e07f91e741a54
      else
        preferred_amount
      end
    end
  end
end
