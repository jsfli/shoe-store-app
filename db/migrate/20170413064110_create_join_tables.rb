class CreateJoinTables < ActiveRecord::Migration[5.0]
  def change

    create_table(:brands_stores) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)

      t.timestamps()
    end
  end
end
