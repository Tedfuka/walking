class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|

      t.integer     :step
      t.datetime    :date
      t.integer     :user_id
      t.timestamps null: true

    end
  end
end
