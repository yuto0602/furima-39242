class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :from_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :from_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, from_id: from_id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
