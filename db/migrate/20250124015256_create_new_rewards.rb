class CreateNewRewards < ActiveRecord::Migration[7.2]
  def change
    create_table :new_rewards do |t|
      t.date :completiondate
      t.text :content
      t.text :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
