# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  region_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class City < ActiveRecord::Base
  has_many :users
  has_many :carts
end
