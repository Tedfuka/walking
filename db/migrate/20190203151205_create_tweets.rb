class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|

      t.text        :tweet
      t.integer     :user_id
      t.text        :image
      t.timestamps null: true

    end
  end
end
