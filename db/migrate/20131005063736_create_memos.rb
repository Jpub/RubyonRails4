class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :memoable_type
      t.integer :memoable_id
      t.string :body

      t.timestamps
    end
  end
end
