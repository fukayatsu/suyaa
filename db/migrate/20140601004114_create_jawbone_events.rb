class CreateJawboneEvents < ActiveRecord::Migration
  def change
    create_table :jawbone_events do |t|
      t.string :name
      t.string :last_created_on

      t.timestamps
    end
  end
end
