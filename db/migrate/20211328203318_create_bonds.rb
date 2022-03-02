class CreateBonds < ActiveRecord::Migration[6.1]
  def change
    create_table :bonds do |t|
        t.references :resident, null: false, foreign_key: true
        t.references :company, null: false, foreign_key: true
        t.string :role, null: false
        t.date :date, null: false
      t.timestamps
    end
  end
end
