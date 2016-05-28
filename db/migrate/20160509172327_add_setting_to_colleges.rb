class AddSettingToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :setting, :string
  end
end
