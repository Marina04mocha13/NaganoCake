class Order < ApplicationRecord
  belongs_to :customer, foreign_key: :customer_id
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  with_options presence: true do
    validates :postal_code
    validates :address
    validates :name
  end

  enum payment_method: {
        credit_card: 0,
        transfer: 1

  }
  enum status: {
        payment_waiting: 0,
        payment_confirmation: 1,
        in_production: 2,
        preparing_delivery: 3,
        delivered: 4
  }

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
