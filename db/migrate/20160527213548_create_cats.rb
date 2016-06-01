class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.boolean :male, null: false, default: true
      t.date :birthdate
      t.text :image_url
      t.text :description

      t.timestamps null: false
    end
  end
end

