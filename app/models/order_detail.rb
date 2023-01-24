class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: :order_id
  belongs_to :item

  enum making_status: {
        production_impossible: 0,
        production_pending: 1,
        in_production: 2,
        production_complete: 3
  }

  def total_price
    (self.item.price * amount * 1.1).round
  end
end
