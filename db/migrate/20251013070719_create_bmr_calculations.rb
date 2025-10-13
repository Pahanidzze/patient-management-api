class CreateBmrCalculations < ActiveRecord::Migration[8.0]
  def change
    create_table :bmr_calculations do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :formula, null: false
      t.decimal :value, null: false, precision: 10

      t.timestamps
    end

    add_index :bmr_calculations, [ :patient_id, :created_at]
  end
end
