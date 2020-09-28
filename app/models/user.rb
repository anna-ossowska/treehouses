class User < ApplicationRecord
  has_many :treehouses
  has_many :bookings
end
