# == Schema Information
#
# Table name: timeslots
#
#  id          :integer          not null, primary key
#  available   :boolean
#  date        :date
#  reserved_at :datetime
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  court_id    :integer
#  reserver_id :integer
#
class Timeslot < ApplicationRecord
  belongs_to(:reserver, { optional: true, :class_name => "User", :foreign_key => "reserver_id", :counter_cache => :reservations_count })
  belongs_to(:court, { :required => true, :class_name => "Court", :foreign_key => "court_id", :counter_cache => :reservations_count })


end
