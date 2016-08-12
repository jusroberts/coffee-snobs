class CreateBeans < ActiveRecord::Migration[5.0]
  def change
    create_table :beans do |t|
      t.integer :roaster_id
      t.string :name
      t.integer :roast_level_id
      t.integer :origin_id
      t.text :notes
      t.boolean :in_stock

      t.timestamps
    end
  end
end
