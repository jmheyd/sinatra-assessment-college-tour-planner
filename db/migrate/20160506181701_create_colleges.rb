class CreateColleges < ActiveRecord::Migration
  def change
		create_table :colleges do |t|
			t.string :name
			t.string :enrollment
			t.string :tuition
			t.string :acceptance_rate
			t.string :location
		end
  end
end
