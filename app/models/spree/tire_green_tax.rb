class TireGreenTax < ActiveRecord::Base
  attr_accessible :amount, :cat, :currency, :description, :weight_min, :weight_max

  has_many :variants, :class_name => "spree_variants"
end