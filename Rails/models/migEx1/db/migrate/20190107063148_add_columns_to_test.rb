class AddColumnsToTest < ActiveRecord::Migration
  def self.up
	change_table :test do |t|
		t.remove :address
		t.integer :age
	end 
  end

  def self.down
	change_table :test do |t|
		t.remove :age
		t.string :address
	end 
  end
end
