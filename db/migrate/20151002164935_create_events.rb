class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :event_body
      t.string :link

      t.timestamps null: false
    end
  end
end
