class Tag < ApplicationRecord
  has_many :taggings

  has_many :items, :through => :taggings, :source => :taggable, source_type: 'Item'

  validates :name, :presence => true, :uniqueness => true
end