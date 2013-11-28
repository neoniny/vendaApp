class FixColumnName < ActiveRecord::Migration
  def change
  	add_column :requirements, :creater, :string
  end
end
