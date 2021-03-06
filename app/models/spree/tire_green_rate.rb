class Spree::TireGreenRate < ActiveRecord::Base
  attr_accessible :amount, :cat, :currency, :description, :weight_min, :weight_max

  has_many :variants, :class_name => "Spree::Variant"
end
