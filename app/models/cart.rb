# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Cart < ActiveRecord::Base
  belongs_to :city
end
