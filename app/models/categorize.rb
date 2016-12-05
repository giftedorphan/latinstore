class Categorize < ApplicationRecord
  belongs_to :category
  belongs_to :categorizable, polymorphic: true

  validates :category_id, :categorizable_id, :categorizable_type, presence: true
  validates_uniqueness_of :category_id, :scope => [:categorizable_id, :categorizable_type]
end