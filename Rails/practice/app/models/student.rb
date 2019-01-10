class Student < ActiveRecord::Base
	validates_presence_of :name, :marks, :rank
	validates_length_of :name, :in=> 5..11
	validates_numericality_of :marks, :less_than_or_equal_to=> 100

end
