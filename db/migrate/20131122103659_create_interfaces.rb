class CreateInterfaces < ActiveRecord::Migration
  def change
    create_table :interfaces do |t|
      t.string :api_version
      t.string :api_ref
      t.string :api_name
      t.string :api_type
      t.string :ymlname
    end
  end
end
