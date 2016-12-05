class Category < ApplicationRecord
  has_many :categorize

  has_many :items, :through => :categorize, :source => :categorizable, source_type: 'Item'

  validates :name, :presence => true, :uniqueness => true
end