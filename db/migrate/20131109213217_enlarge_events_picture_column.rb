class EnlargeEventsPictureColumn < ActiveRecord::Migration
  def change
  	change_column :events, :picture, :text
  end
end
