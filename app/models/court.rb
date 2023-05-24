# == Schema Information
#
# Table name: courts
#
#  id                 :integer          not null, primary key
#  reservations_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  location_id        :integer
#
class Court < ApplicationRecord

  has_many(:reservations, { :class_name => "Timeslot", :foreign_key => "court_id", :dependent => :destroy })
  belongs_to(:location, { :required => true, :class_name => "Location", :foreign_key => "location_id", :counter_cache => true })


end
