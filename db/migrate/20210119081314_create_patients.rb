class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.boolean :is_insured

      t.timestamps
    end
  end
end
