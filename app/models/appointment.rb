class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :issue, :date, :start_time, :end_time, :doctor_id, :patient_id, presence: true
end
