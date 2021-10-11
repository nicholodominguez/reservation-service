class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.jsonb :phone_numbers

      t.index :email, unique: true
      t.timestamps
    end
  end
end
