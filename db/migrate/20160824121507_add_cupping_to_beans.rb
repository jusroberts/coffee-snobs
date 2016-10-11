class AddCuppingToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :cupping, :boolean
  end
end
