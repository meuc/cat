class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :cat, null: false
      t.datetime :starts_at, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
