class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :pip_id

      t.timestamps null: false
    end
  end
end
