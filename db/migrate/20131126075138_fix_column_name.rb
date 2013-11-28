class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :requirements, :client_name, :entprs_name
  end
end
