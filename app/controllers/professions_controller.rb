class ProfessionsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
	
  def index
  end

  def create
    @blah=params[:Professions][:tf_Designation]
    if !params[:Professions][:tf_Designation].blank?
       @Designation = params[:Professions][:tf_Designation]
       @Company = params[:Professions][:tf_Company]
       @From = params[:Professions][:fromyear]
       @To = params[:Professions][:toyear]
       @Profession = Profession.new( :UserID => current_user.id, :Designation => @Designation, :Company => @Company, :Job_From => @From, :Job_To => @To, :Private => "0")
       @Profession = @Profession.save
    end
    puts params[:valPro]
    if !params[:parameters].blank?
      params[:parameters].each do |keydesignation, designation|
        if !designation.nil?
          @designation = designation
          puts @designation
          params[:parametersCompany].each do |keycompany, company|
            if keydesignation == keycompany
              @company = company
            end
          end  
          params[:ParametersFromProf].each do |keyfromprof, fromprof|
            if keydesignation == keyfromprof
              @from = fromprof
            end
          end
          params[:ParametersToProf].each do |keytopro, toprof|
            if keydesignation == keytopro
              @to=toprof          
            end
          end
          @Profession = Profession.new( :UserID => current_user.id, :Designation => @designation, :Company => @company, :Job_From => @from, :Job_To => @to,:Private => "0")
          @Profession.save
        end
      end  
    end
       redirect_to '/educations'
  end

  def destroy
  end


  def new
  	@Profession = Profession.new
  end
end
