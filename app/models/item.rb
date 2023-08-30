class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :from
  belongs_to :date_of_delivery


  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_category_id, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :from_id, presence: true
  validates :date_of_delivery_id, presence: true
  validates :price, presence: true
  validates :price, numericality: {only_integer: true}
  validates :price, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999}
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :from_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :date_of_delivery_id, numericality: { other_than: 1, message: "can't be blank"}

end
