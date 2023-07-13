class AddColumnToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :code, :string, after: :price
    add_column :items, :stock, :integer, after: :code
  end
end
