class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :user_id
      t.integer :candidate_id
      t.string :position
      t.string :description
      t.datetime :schedule_date
      t.string :session_id

      t.timestamps
    end
  end
end
