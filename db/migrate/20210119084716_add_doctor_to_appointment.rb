class AddDoctorToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :doctor, null: false, foreign_key: true
  end
end
