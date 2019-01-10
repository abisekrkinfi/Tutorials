class PlayWithRails < ActiveRecord::Migration
  def self.up
	create_table :test do |t|
		t.string :name
		t.string :address
		
		t.timestamps
	end 
  end

  def self.down
	drop_table :test
  end
end
