class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :book, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps
    end
  end
end
