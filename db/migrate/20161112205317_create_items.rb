class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table(:items, id: :uuid) do |t|
      t.string :name,        null: false
      t.string :price,       null: false
      t.string :stock,       null: false, default: "0"
      t.text   :description, null: false

      t.timestamps
    end
  end
end