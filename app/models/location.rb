# == Schema Information
#
# Table name: locations
#
#  id           :integer          not null, primary key
#  courts_count :integer
#  description  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Location < ApplicationRecord

  has_many(:courts, { :class_name => "Court", :foreign_key => "location_id", :dependent => :destroy })

end
