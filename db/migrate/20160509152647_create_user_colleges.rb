class CreateUserColleges < ActiveRecord::Migration
  def change
  	create_table :user_colleges do |t|
			t.integer :college_id
			t.integer :user_id
			t.string :review
			t.string :my_notes
		end
  end
end
