class EducationsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
	
  def index
  end

  def create
  	if !params[:Educations][:University].blank?
  	 @UniversityID = params[:Educations][:University]
     @chapter=params[:Educations][:chapter]
  	 @From = params[:Educations][:fromyear]
  	 @To = params[:Educations][:toyear]
  	 @Education = Education.new( :UserID => current_user.id, :Chapter => @chapter ,:UniversityID => @UniversityID, :SchoolFrom => @From, :SchoolTo => @To, :Private => "0" )
  	 @Education = @Education.save
  	end
    if !params[:parameterUniversity].blank?
      params[:parameterUniversity].each do |keydeg, degree|
        if !degree.nil?
          @degree=degree
          
          params[:parametersChapter].each do |keychap,chap|
            if keydeg==keychap
              @chap=chap
            end 
          end

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
          @Education = Education.new( :UserID => current_user.id, :Chapter => @chap ,:UniversityID => @degree, :SchoolFrom => @from, :SchoolTo => @to, :Private => "0")
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
