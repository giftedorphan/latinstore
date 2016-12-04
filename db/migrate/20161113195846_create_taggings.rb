class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table(:taggings, id: :uuid) do |t|
      t.uuid    :tag_id,        null: false
      t.uuid    :taggable_id,   null: false
      t.string  :taggable_type, null: false

      t.timestamps
    end

    add_index :taggings, [:taggable_id, :taggable_type]
  end
end