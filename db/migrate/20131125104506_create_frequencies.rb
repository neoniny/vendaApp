class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :api_ref
      t.string :tier3
      t.string :tier2
      t.string :tier1
    end
  end
end
