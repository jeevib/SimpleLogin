class AddAppointmentToPatients < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :patient, null: false, foreign_key: true
  end
end
