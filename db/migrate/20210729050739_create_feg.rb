class CreateFeg < ActiveRecord::Migration[5.2]
  def change
    create_table :feg_preaches do |t|
      t.timestamps

      t.string :url_code
      t.string :title
      t.datetime :date
      t.string :description
      t.integer :duration_in_seconds
    end
  end
end
