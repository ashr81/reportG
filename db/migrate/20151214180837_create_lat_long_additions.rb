class CreateLatLongAdditions < ActiveRecord::Migration
  def change
    create_table :lat_long_additions do |t|

      t.timestamps null: false
    end
  end
end
