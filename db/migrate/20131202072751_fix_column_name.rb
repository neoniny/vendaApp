class FixColumnName < ActiveRecord::Migration
  def change
  	add_column :interfaces, :short_description, :text
  end
end
