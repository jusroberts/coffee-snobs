class AddBeanIdToBeanRating < ActiveRecord::Migration[5.0]
  def change
    add_column :bean_ratings, :bean_id, :integer
    remove_column :bean_ratings, :coffee_id
  end
end
