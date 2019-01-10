class UpdateRankToStudents < ActiveRecord::Migration
  def self.up
	Student.update_all ["rank = ?",0]
  end

  def self.down
  end
end
