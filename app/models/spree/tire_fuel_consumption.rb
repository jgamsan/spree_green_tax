class Spree::TireFuelConsumption < ActiveRecord::Base
  attr_accessible :name
  has_many :variants, :class_name => "spree_variants"
end
