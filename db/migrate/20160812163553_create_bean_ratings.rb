class CreateBeanRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :bean_ratings do |t|
      t.integer :coffee_id
      t.integer :user_id
      t.integer :rating
      t.boolean :buy_again
      t.text :comments

      t.timestamps
    end
  end
end
