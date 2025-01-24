class CreateCompletes < ActiveRecord::Migration[7.2]
  def change
    create_table :completes do |t|
      t.text :content
      t.integer :progress
      t.references :user, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
