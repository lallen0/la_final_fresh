# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  bio                :string
#  email              :string
#  first_name         :string
#  last_name          :string
#  level              :integer
#  password_digest    :string
#  reservations_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:reservations, { :class_name => "Timeslot", :foreign_key => "reserver_id", :dependent => :destroy })

end
