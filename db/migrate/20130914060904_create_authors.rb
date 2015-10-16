class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :user, index: true
      t.string :name
      t.date :birth
      t.text :address
      t.string :ctype
      t.binary :photo

      t.timestamps
    end
  end
end
