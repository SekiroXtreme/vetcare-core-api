class Service < ApplicationRecord
  belongs_to :service_category
  has_many :appointments
  validates :name, :price, :duration_minutes, presence: true
end
