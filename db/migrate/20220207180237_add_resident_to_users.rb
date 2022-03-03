class AddResidentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :resident, null: false, foreign_key: true, unique: true
  end
end
