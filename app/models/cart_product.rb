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
end
