class ChangeUniversityIdDatatype < ActiveRecord::Migration
	def self.up
		change_column :educations, :UniversityID, 'integer USING CAST("UniversityID" AS integer)'
	end
	
  	def self.down

    end
end
