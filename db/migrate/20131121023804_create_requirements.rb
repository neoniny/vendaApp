class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :client_name

      t.timestamps
    end
  end
end
