class CreateRewards < ActiveRecord::Migration[7.2]
  def change
    create_table :rewards do |t|
      t.date :completiondate
      t.text :content
      t.text :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
