class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.string :time_slot
      t.string :reason
      t.integer :status, default: 0
      t.string :notes
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
