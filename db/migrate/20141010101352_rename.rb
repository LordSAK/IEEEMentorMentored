class Rename < ActiveRecord::Migration
  
	def self.up
    	rename_column :educations, :SchoolName, :UniversityID
  	end

	  def self.down
    	# rename back if you need
  	end
end
