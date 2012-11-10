class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
