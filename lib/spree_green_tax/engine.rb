module SpreeGreenTax
  class Engine < Rails::Engine
    require 'spree/core'
    engine_name 'spree_green_tax'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
<<<<<<< HEAD
    app.config.spree.calculators.add_class('tire_green_tax')
    app.config.spree.calculators.tire_green_tax = [ 
      Spree::Calculator::TireGreenTax
    ] 
=======

    initializer 'spree.register.green_tax', :after => "spree.register.calculators" do |app|
       app.config.spree.calculators.tax_rates << Spree::Calculator::TireGreenRate
    end
>>>>>>> 84af9e8843a4d686d624498730fade892a045e0f
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
