class Item < ApplicationRecord
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable

  has_many :categories, :through => :categorizes
  has_many :categorizes, :as => :categorizable

  validates_presence_of :name, :price, :stock
end