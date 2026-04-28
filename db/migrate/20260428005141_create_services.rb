class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :service_categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :services do |t|
      t.references :service_category, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2
      t.integer :duration_minutes, default: 30
      t.integer :target_species, default: 0 # 0: All, 1: Dogs, 2: Cats...

      t.timestamps
    end
  end
end
