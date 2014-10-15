class SettingsController < ApplicationController
 #caches_page :index, :show  
 #skip_before_filter :verify_authenticity_token, :only => [:index, :show, :create, :destroy]

  def create
    @user_basic=User.find(current_user.id)
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @Chapters=Chapter.all
    @Universites=University.all
    
    
    @user_basic.update_attribute( :interest, params[:settings][:interest])
    @user_basic.update_attribute( :societies, params[:settings][:societies])
    @user_basic.update_attribute( :sector, params[:settings][:sector])
    @user_basic.update_attribute( :partnership, params[:settings][:partnership])

    if !params[:settings].nil?
      @user_basic.update_attribute(:photo, params[:settings][:photo]) 
    end

    @user_location = User.find(current_user.id)
    if params[:settings][:ChkBx_Location] == "on" or params[:settings][:ChkBx_Location] == "1"
      #@publicemail = "1"
      #@value = params[:settings][:ChkBx_Location]
      @user_basic.update_attribute( :Private, "1" )
      #c.update_attribute( :Private, "1")
    else
      puts "Hassan ALi Khan"
      @user_basic.update_attribute( :Private, "0" )
    end
        
       Profession.delete_all(:UserID => current_user.id)
  #    if params[:ChkBx_Profession].to_i == 1
    @blah = params[:ChkBx_Profession]
  
    if !params[:tf_designation].blank?
      params[:tf_designation].each do |keydesignation,designation|
        if !designation.nil?
          @desig = designation
          params[:tf_company].each do |keycompany,company|
            if keydesignation == keycompany
              @comp = company
            end
          end
          params[:tf_fromdesignation].each do |keyfromprof,fromprof|
            if keydesignation ==  keyfromprof
              @fromdesigcom = fromprof
            end
          end
          params[:tf_todesignation].each do |keytoprof,toprof|
            if keydesignation==keytoprof
              @todesigcom = toprof
            end
          end
          @Profession = Profession.new( :UserID => current_user.id, :Designation => @desig, :Company => @comp, :Job_From => @fromdesigcom, :Job_To => @todesigcom )
          @Profession.save
        end
      end
    end
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
        @Profession = Profession.new( :UserID => current_user.id, :Designation => @designation, :Company => @company, :Job_From => @from, :Job_To => @to)
        @Profession.save
        end
      end  
    end
    @user_profession=Profession.where(:UserID => current_user.id)
    if !@user_profession.blank? 
      @user_profession.each do |p|
      if params[:ChkBx_Profession].to_i == 1
        p.update_attribute( :Private, params[:ChkBx_Profession] )
      elsif params[:ChkBx_Profession].to_i == 0
        p.update_attribute( :Private, "0" )
      end
    end
  end


  #  @blah2 = params[:ChkBx_Education]
  #if params[:ChkBx_Education].to_s == "1"
    Education.delete_all(:UserID => current_user.id)
    if !params[:ddl_University].blank?
        params[:ddl_University].each do |keydeg, degree|
        if !degree.nil?
          @degree=degree

          params[:ddl_Chapter].each do |keychap, chap|
            if keydeg==keychap
              @chap=chap
            end
          end
          params[:tf_fromeducation].each do |keyfrom, from|
            if keydeg== keyfrom
              @from=from
            end
          end

          params[:tf_toeducation].each do |keyto, to|
            if keydeg==keyto
              @to=to          
            end
          end
        @Education = Education.new( :UserID => current_user.id,:Chapter => @chap ,:UniversityID => @degree, :SchoolFrom => @from, :SchoolTo => @to )
        @Education.save
      end
    end
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
          @Education = Education.new( :UserID => current_user.id, :Chapter => @chap ,:UniversityID => @degree, :SchoolFrom => @from, :SchoolTo => @to )
          @Education.save
        end
      end
      end
      @user_education=Education.where(:UserID => current_user.id)
      if !@user_education.blank?
        @user_education.each do |e|
        if params[:ChkBx_Education].to_i == 1
          e.update_attribute( :Private, params[:ChkBx_Education] )
        elsif params[:ChkBx_Education].to_i == 0
          e.update_attribute( :Private, "0" )
        end
      end
    end


  @user_communication=Communication.where(:UserID => current_user.id)
    Communication.delete_all(:UserID => current_user.id)     
    if !params[:tf_phone].blank?
        @Phone = "Phone"
        @Phone_detail = params[:tf_phone]
        if params[:settings][:ChkBx_Phone] == "on" or params[:settings][:ChkBx_Phone] == "1"
          @publicphone = "1"
        end
        @Phone_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @Phone_detail, :Private => @publicphone, :Preferred => @Phone_Preferred)
        @communication.save
    end

    if !params[:tf_email].blank?
        @Email = "Email"
        @Email_detail = params[:tf_email]
        if params[:settings][:ChkBx_Email] == "on" or params[:settings][:ChkBx_Email] == "1"
          @publicemail = "1"
        end  
        @Email_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Email, :CommunicationDetail => @Email_detail, :Private => @publicemail, :Preferred => @Email_Preferred)     
        @communication.save
    end
    
    if !params[:tf_skype].blank?  
        @Skype = "Skype"
        @Skype_detail = params[:tf_skype]
        if params[:settings][:ChkBx_Skype] == "on" or params[:settings][:ChkBx_Skype] == "1"
          @publicskype = "1"
        end
        @Skype_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Skype, :CommunicationDetail => @Skype_detail, :Private => @publicskype, :Preferred => @Skype_Preferred)
        @communication.save 
    end

    if !params[:tf_website].blank?  
      @Website = "Website"
      @Website_detail = params[:tf_website]
        if params[:settings][:ChkBx_Website] == "on" or params[:settings][:ChkBx_Website] == "1"
          @publicwebsite = "1"
        end
      @Website_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Website, :CommunicationDetail => @Website_detail, :Private => @publicwebsite, :Preferred => @Website_Preferred)
      @communication.save
    end

    if !params[:tf_twitter].blank?  
      @Twitter = "Twitter"
      @Twitter_detail = params[:tf_twitter]
        if params[:settings][:ChkBx_Twitter] == "on" or params[:settings][:ChkBx_Twitter] == "1"
          @publictwitter = "1"
        end
      @Twitter_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Twitter, :CommunicationDetail => @Twitter_detail, :Private => @publictwitter, :Preferred => @Twitter_Preferred)
      @communication.save
    end

  #  @user_communication=Communication.where(:UserID => current_user.id)
  #  if !@user_communication.blank?
  #      @user_communication.each do |c|
  #        puts params[:settings][:ChkBx_Email].to_s
  #        if params[:settings][:ChkBx_Email] == "on"
  #          Communication.delete_all(:UserID => current_user.id)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @Phone_detail, :Private => "1", :Preferred => @Phone_Preferred)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Email, :CommunicationDetail => @Email_detail, :Private => @publicemail, :Preferred => @Email_Preferred)     
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Skype, :CommunicationDetail => @Skype_detail, :Private => @publicskype, :Preferred => @Skype_Preferred)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Website, :CommunicationDetail => @Website_detail, :Private => @publicwebsite, :Preferred => @Website_Preferred)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Twitter, :CommunicationDetail => @Twitter_detail, :Private => @publictwitter, :Preferred => @Twitter_Preferred)
  #          @user_communication.save
  #            #c.update_attribute( :Private, "1")
  #        end

  #        if params[:settings][:ChkBx_Skype] == "on"
  #          Communication.delete_all(:UserID => current_user.id)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @Phone_detail, :Private => @publicphone, :Preferred => @Phone_Preferred)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Email, :CommunicationDetail => @Email_detail, :Private => "1", :Preferred => @Email_Preferred)     
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Skype, :CommunicationDetail => @Skype_detail, :Private => @publicskype, :Preferred => @Skype_Preferred)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Website, :CommunicationDetail => @Website_detail, :Private => @publicwebsite, :Preferred => @Website_Preferred)
  #          @user_communication = Communication.new( :UserID => current_user.id, :CommunicationMode => @Twitter, :CommunicationDetail => @Twitter_detail, :Private => @publictwitter, :Preferred => @Twitter_Preferred)
  #          @user_communication.save
              #c.update_attribute( :Private, "1")
  #        end     
  #      end
  #  end    

    redirect_to "/default"
    #@user = User.new(user_params)
  end

  def destroy
  end

  def reset_password
    
    user = User.find_by(email: current_user.email.downcase)
    #puts user.authenticate(params[:tf_currentpassword])
    #user = User.find(current_user.id)
    if user && user.authenticate(params[:tf_currentpassword])
      puts "Saghir"
       user.update_attribute( :password, params[:tf_newpassword] )
       user.update_attribute( :password_confirmation, params[:tf_re_enterpassword] )
    end
    redirect_to '/default'
  end



  def delete_my_account
    user = User.find_by(email: current_user.email.downcase)
    if user && user.authenticate(params[:tf_password])
      User.delete( user.id )
      Availability.delete_all(:UserID => user.id)
      Profession.delete_all(:UserID => user.id)
      Education.delete_all(:UserID => user.id)
      Communication.delete_all(:UserID => user.id)
    end
    redirect_to root_path
  end

  def show

  end

  def new
  	@user_basic=User.find(current_user.id)
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user_profession=Profession.where(:UserID => current_user.id)
  	@user_education=Education.where(:UserID => current_user.id)
    @user_communication=Communication.where(:UserID => current_user.id)
    @InterestAreas=Interest.all
    @Societies=Societies.all
    @work_sector=WorkSector.all
    @Partnerships=MentoringPartnership.all
    @Chapters=Chapter.all
    @Universites=University.all
  end

  def index
    @user_basic=User.find(current_user.id)
  end

 def update

 end
end
