class AddTimeToSong < ActiveRecord::Migration
  def change
    add_column :songs, :time, :string
  end
end
