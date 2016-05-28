class AddUrlToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :url, :string
  end
end
