class ChangeDataSlipnoToReceivingOrder < ActiveRecord::Migration[7.0]
  def up
    change_column :receiving_orders, :slip_no, :integer
  end
end
