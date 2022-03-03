class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, unique: true
      t.string :website
      t.string :logo
      t.string :lat, null: false 
      t.string :long, null: false
      t.string :email, null: false, unique: true
      t.string :telephone, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
