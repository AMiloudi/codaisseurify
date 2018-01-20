class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :released_year

      t.timestamps
    end
  end
end
