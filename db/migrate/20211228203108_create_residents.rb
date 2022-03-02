class CreateResidents < ActiveRecord::Migration[6.1]
  def change
    create_table :residents do |t|
      t.string :name, null: false
      t.string :whatsapp, null: false
      t.string :email, null: false
      t.bigint :registration_id, null: false 
      t.date :initial_date, null: false 
      t.date :final_date, null: false 
      t.boolean :status, default: true
      t.boolean :flag_published, default: true
      
      t.timestamps
    end
  end
end