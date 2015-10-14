class CreateSonglists < ActiveRecord::Migration
  def change
    create_table :songlists do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
