class SettingsController < ApplicationController
 #caches_page :index, :show  
 #skip_before_filter :verify_authenticity_token, :only => [:index, :show, :create, :destroy]

  def create
    @user_basic=User.find(current_user.id)
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    
    
    
    
    #requestfrom.first.update_attribute(:IsApproved, "2")
    @user_basic.update_attribute( :user_Need, params[:user_Need])
    @user_basic.update_attribute( :SkillNeed1, params[:SkillNeed1])
    @user_basic.update_attribute( :skillNeed2, params[:SkillNeed2])   
    if !params[:settings].nil?
      @user_basic.update_attribute(:photo, params[:settings][:photo]) 
    end
        
       Profession.delete_all(:UserID => current_user.id)
  #    if params[:ChkBx_Profession].to_i == 1
    @blah = params[:ChkBx_Profession]
  #  puts "Hassan"
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
        puts "Hassan"
      elsif params[:ChkBx_Profession].to_i == 0
        p.update_attribute( :Private, "0" )
        puts "Ali"
      end
    end
  end


  #  @blah2 = params[:ChkBx_Education]
  #if params[:ChkBx_Education].to_s == "1"
    Education.delete_all(:UserID => current_user.id)
    if !params[:tf_education].blank?
        params[:tf_education].each do |keydeg, degree|
        if !degree.nil?
          @degree=degree
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
        @Education = Education.new( :UserID => current_user.id, :SchoolName => @degree, :SchoolFrom => @from, :SchoolTo => @to )
        @Education.save
      end
    end
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
        @Education = Education.new( :UserID => current_user.id, :SchoolName => @degree, :SchoolFrom => @from, :SchoolTo => @to )
        @Education.save
      end
    end
    end
    @user_education=Education.where(:UserID => current_user.id)
    if !@user_education.blank?
      @user_education.each do |e|
      if params[:ChkBx_Education].to_i == 1
        e.update_attribute( :Private, params[:ChkBx_Education] )
        puts "Hassan1"
      elsif params[:ChkBx_Education].to_i == 0
        e.update_attribute( :Private, "0" )
        puts "Ali1"
      end
    end
  end
           
    Communication.delete_all(:UserID => current_user.id)     
    if !params[:tf_Phone].blank?
        @Phone = "Phone"
        @Phone_detail = params[:tf_phone]
        @Phone_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @Phone_detail, :Private => @publicphone, :Preferred => @Phone_Preferred)
        @communication.save
    end

    if !params[:tf_email].blank?
        @Email = "Email"
        @Email_detail = params[:tf_email]
        @Email_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Email, :CommunicationDetail => @Email_detail, :Private => @publicemail, :Preferred => @Email_Preferred)     
        @communication.save
    end
    
    if !params[:tf_skype].blank?  
        @Skype = "Skype"
        @Skype_detail = params[:tf_skype]
        @Skype_Preferred = "Preferred"
        @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Skype, :CommunicationDetail => @Skype_detail, :Private => @publicskype, :Preferred => @Skype_Preferred)
        @communication.save 
    end

    if !params[:tf_website].blank?  
      @Website = "Website"
      @Website_detail = params[:tf_website]
      @Website_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Website, :CommunicationDetail => @Website_detail, :Private => @publicwebsite, :Preferred => @Website_Preferred)
      @communication.save
    end

    if !params[:tf_twitter].blank?  
      @Twitter = "Twitter"
      @Twitter_detail = params[:tf_twitter]
      @Twitter_Preferred = "Preferred"
      @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Twitter, :CommunicationDetail => @Twitter_detail, :Private => @publictwitter, :Preferred => @Twitter_Preferred)
      @communication.save
    end
  @user_communication=Communication.where(:UserID => current_user.id)
  if !@user_communication.blank?
    @user_communication.each do |c|
    if params[:ChkBx_Phone].to_i == 1
      c.update_attribute( :Private, params[:ChkBx_Phone] )
      puts "Hassan2"
    elsif params[:ChkBx_Phone].to_i == 0
      c.update_attribute( :Private, "0" )
      puts "Ali2"
    end

    if params[:ChkBx_Email].to_i == 1
      c.update_attribute( :Private, params[:ChkBx_Email] )
      puts "Hassan3"
    elsif params[:ChkBx_Email].to_i == 0
      c.update_attribute( :Private, "0" )
      puts "Ali3"
    end
    
    if params[:ChkBx_Skype].to_i == 1
      c.update_attribute( :Private, params[:ChkBx_Skype] )
      puts "Hassan4"
    elsif params[:ChkBx_Skype].to_i == 0
      c.update_attribute( :Private, "0" )
      puts "Ali4"
    end

    if params[:ChkBx_Website].to_i == 1
      c.update_attribute( :Private, params[:ChkBx_Website] )
      puts "Hassan4"
    elsif params[:ChkBx_Website].to_i == 0
      c.update_attribute( :Private, "0" )
      puts "Ali4"
    end

    if params[:ChkBx_Twitter].to_i == 1
      c.update_attribute( :Private, params[:ChkBx_Twitter] )
      puts "Hassan4"
    elsif params[:ChkBx_Twitter].to_i == 0
      c.update_attribute( :Private, "0" )
      puts "Ali4"
    end
  end
end

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
      puts "Hassan"
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
  end

  def index
    @user_basic=User.find(current_user.id)
  end

 def update

 end
end
