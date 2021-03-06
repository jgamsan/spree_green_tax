module SpreeGreenTax
  class Engine < Rails::Engine
    require 'spree/core'
    engine_name 'spree_green_tax'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
    initializer 'spree.register.calculators' do |app|
      app.config.spree.calculators.tax_rates << Spree::Calculator::TireGreenRate
      app.config.spree.calculators.shipping_methods << Spree::Calculator::VariableRate
    end
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
