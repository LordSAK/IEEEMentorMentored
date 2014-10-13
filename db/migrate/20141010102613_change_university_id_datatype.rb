class ChangeUniversityIdDatatype < ActiveRecord::Migration
	def self.up
		change_table :educations do |t|
			t.change :UniversityID, :integer , 'integer  USING CAST("RequestFrom" AS integer)'
		end
	end
	
  	def self.down

    end
end
