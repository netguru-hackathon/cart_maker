# coding: utf-8
# == Schema Information
#
# Table name: cart_products
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  photo_url  :string
#

class CartProduct < ActiveRecord::Base
  belongs_to :cart
  validates :quantity, numericality: { greater_than: 0 }

  def image
    return photo_url if photo_url.present?
    "http://placehold.it/100x100"
  end

  def bulk_price
    "#{quantity * 2} zł"
  end
end
