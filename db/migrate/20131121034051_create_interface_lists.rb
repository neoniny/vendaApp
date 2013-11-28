class CreateInterfaceLists < ActiveRecord::Migration
  def change
    create_table :interface_lists do |t|
      t.string :ref
      t.string :name
      t.string :interface_type
      t.text :definition
    end
  end
end
