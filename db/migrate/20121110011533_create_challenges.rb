class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.string :description
    	t.binary :challenge
    	t.binary :starter_code
    	t.binary :test_case

      t.timestamps
    end
  end
end
