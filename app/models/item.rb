class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee_status
    belongs_to :prefecture
    belongs_to :prepare_days
  end

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :prepare_days_id
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :prepare_days_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
