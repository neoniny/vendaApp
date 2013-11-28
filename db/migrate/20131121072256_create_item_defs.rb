class CreateItemDefs < ActiveRecord::Migration
  def change
    create_table :item_defs do |t|
      t.string :requirement_id
      t.string :request_type
      t.string :api_version
      t.string :batch
      t.string :transport_type
      t.string :notification
      t.string :encryption
      t.string :job_frequency

      t.timestamps
    end
  end
end
