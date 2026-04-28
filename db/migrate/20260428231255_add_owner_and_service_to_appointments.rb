class AddOwnerAndServiceToAppointments < ActiveRecord::Migration[8.1]
  def change
    add_column :appointments, :owner_id, :integer

    add_column :appointments, :service_id, :integer

    add_index :appointments, :owner_id
    add_index :appointments, :service_id

    add_foreign_key :appointments, :users, column: :owner_id
    add_foreign_key :appointments, :services, column: :service_id
  end
end
