class AddPetersonsUrlToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :petersons_url, :string
  end
end

