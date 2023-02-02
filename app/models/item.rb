class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  has_one_attached :image
  
  with_options presence: true do
    validates :genre_id
    validates :name
    validates :introduction
    validates :price
    validates :is_active
  end

  def add_tax_price
    (self.price * 1.1).round
  end

  def get_item_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search(word)
    where(["name like?", "%#{word}%"])
  end
end
