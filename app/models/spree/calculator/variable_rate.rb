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
      if object.total > preferred_max_amount
        0
      else
        preferred_amount
      end
    end
  end
end
