class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :guest, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nights
      t.integer :guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.string :currency
      t.text :description
      t.decimal :payout_price, precision: 12, scale: 2, default: "0.0", null: false
      t.decimal :security_price, precision: 12, scale: 2, default: "0.0", null: false
      t.decimal :total_price, precision: 12, scale: 2, default: "0.0", null: false
      t.string :status

      t.timestamps
    end
  end
end
