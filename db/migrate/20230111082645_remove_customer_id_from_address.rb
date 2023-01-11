class RemoveCustomerIdFromAddress < ActiveRecord::Migration[6.1]
  def change
    remove_reference :addresses, :customer_id, null: false, foreign_key: true
  end
end
