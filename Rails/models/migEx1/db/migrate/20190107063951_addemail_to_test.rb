class AddemailToTest < ActiveRecord::Migration
  def self.up
	add_column :test, :email_address , :string
	add_column :test, :Description , :string
  end

  def self.down
	remove_column :test, :email_address
	remove_column :test, :Description
  end
end
