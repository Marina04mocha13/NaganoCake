class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item, foreign_key: :item_id

  def total_price
    (self.item.price * amount * 1.1).round
  end
end
