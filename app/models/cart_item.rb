class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item, foreign_key: :item_id

  def total_price
    (self.item.add_tax_price).round
  end
end
