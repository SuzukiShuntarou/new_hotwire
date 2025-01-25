class CreateMarks < ActiveRecord::Migration[7.2]
  def change
    create_table :marks do |t|
      t.text :content
      t.integer :progress
      t.references :user, null: false, foreign_key: true
      t.references :treat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
