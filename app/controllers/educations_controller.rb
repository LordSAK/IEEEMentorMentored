class EducationsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
	
  def index
  end

  def create
  	if !params[:Educations][:tf_Degree].blank? && params[:Educations][:tf_Degree] != "Degree"
  	 @UniversityID = params[:Educations][:University]
     @chapter=params[:Educations][:chapter]
  	 @From = params[:Educations][:fromyear]
  	 @To = params[:Educations][:toyear]
  	 @Education = Education.new( :UserID => current_user.id, :Chapter => @chapter ,:UniversityID => @UniversityID, :SchoolFrom => @From, :SchoolTo => @To, :Private => "0" )
  	 @Education = @Education.save
  	end
    if !params[:parametersSch].blank?
      params[:parametersSch].each do |keydeg, degree|
        if !degree.nil?
          @degree=degree
          params[:ParametersFromSch].each do |keyfrom, from|
            if keydeg== keyfrom
              @from=from
            end
          end

          params[:ParametersToSch].each do |keyto, to|
            if keydeg==keyto
              @to=to          
            end
          end
          @Education = Education.new( :UserID => current_user.id, :Chapter => @chapter ,:UniversityID => @UniversityID, :SchoolFrom => @from, :SchoolTo => @to, :Private => "0")
          @Education.save
        end
      end
    end
  	redirect_to '/default'
  end

  def destroy
  end

  def new
  	@Education = Education.new
    @Chapters=Chapter.all
    @Universites=University.all
  end
end
