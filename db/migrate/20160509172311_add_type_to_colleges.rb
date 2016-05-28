class AddTypeToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :type, :string
  end
end
