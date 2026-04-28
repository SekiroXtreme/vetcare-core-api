class Appointment < ApplicationRecord
  belongs_to :pet

  enum status: { pending: 0, confirmed: 1,  completed: 2, cancelled: 3 }

  validate :no_overlap

  def no_overlap
    if Appointment.where(appointment_date: appointment_date, time_slot: time_slot).exists?
      errors.add(:time_slot, "is already booked for this date")
    end
  end
end
