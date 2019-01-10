class User < ActiveRecord::Base

	validates_presence_of :name
	validates_length_of :name, :is=>5
	validates_inclusion_of :age, :in=> 10..20, :message => "Grow up Kid!"
	validates_uniqueness_of :email
end
