class CreateCategorizes < ActiveRecord::Migration[5.0]
  def change
    create_table(:categorizes, id: :uuid) do |t|
      t.uuid    :category_id,         null: false
      t.uuid    :categorizable_id,    null: false
      t.string  :categorizable_type,  null: false

      t.timestamps
    end

    add_index :categorizes, [:categorizable_id, :categorizable_type]
  end
end