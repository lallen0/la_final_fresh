class Court < ApplicationRecord

  has_many(:reservations, { :class_name => "Timeslot", :foreign_key => "court_id", :dependent => :destroy })
  belongs_to(:location, { :required => true, :class_name => "Location", :foreign_key => "location_id", :counter_cache => true })


end
