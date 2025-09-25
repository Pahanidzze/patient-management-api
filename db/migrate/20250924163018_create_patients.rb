class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.date :birthday, null: false
      t.string :gender, null: false
      t.integer :height, null: false
      t.decimal :weight, null: false, precision: 5, scale: 2

      t.timestamps
    end

    add_index :patients
              [ :first_name, :last_name, :middle_name, :birthday ]
              { unique: true,
              name: "uniqueness_constraint_for_a_name_and_birthday_group" }

    add_index :patients, :birthday
    add_index :patients, :gender
  end
end
