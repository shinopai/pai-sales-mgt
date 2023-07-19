class ChangeDataSlipnoToReceivingOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :receiving_orders, :slip_no, :string
  end
end
