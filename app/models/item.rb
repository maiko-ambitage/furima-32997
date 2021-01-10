class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to_active_hash :shipping_fee_status
  belongs_to :prefecture
  belongs_to :prepare_days

  default_scope -> { order(created_at: :desc) }
  has_one_attached :image
  belongs_to :user
  has_one :orders

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :prepare_days_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
