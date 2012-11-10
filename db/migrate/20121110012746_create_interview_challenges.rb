class CreateInterviewChallenges < ActiveRecord::Migration
  def change
    create_table :interview_challenges do |t|
      t.integer :interview_id
      t.integer :challenge_id
      t.boolean :has_solution
      t.binary :solution
      t.timestamps
    end
  end
end
