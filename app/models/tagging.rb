class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :taggable, polymorphic: true

  validates :tag_id, :taggable_id, :taggable_type, presence: true
  validates_uniqueness_of :tag_id, :scope => [:taggable_id, :taggable_type]
end