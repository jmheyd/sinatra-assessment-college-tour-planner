class ChangeColumnNameInColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :college_type, :string
  	remove_column :colleges, :type, :string
  end
end
