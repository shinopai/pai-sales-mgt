class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :slip_no, null: false
      t.integer :quantity, null: false
      t.datetime :order_date, null: false
      t.integer :status, null: false, default: 1
      t.references :item, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
