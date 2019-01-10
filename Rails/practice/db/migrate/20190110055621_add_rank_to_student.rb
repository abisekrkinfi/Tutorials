class AddRankToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :rank, :integer
  end

  def self.down
    remove_column :students, :rank
  end
end
