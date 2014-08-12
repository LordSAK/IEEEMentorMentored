class SearchController < ApplicationController
  def create
       
     @userrequest = Userrequest.new( :RequestFrom => current_user.id, :RequestTo => params[:id] , :IsApproved=> "0", :SkillType => "" )
     @userrequest.save

     redirect_to '/searching'
  end
  
  def search
    @user_img = User.find(current_user.id)
    @InterestAreas=Interest.all
    @Societies=Societies.all
    @work_sector=WorkSector.all
    @Partnerships=MentoringPartnership.all
      
    
    #zip 
#    if ( !params[:tf_Zip].blank? or params[:tf_Zip] != "" ) and ( params[:Interest] == "1" ) and (params[:tf_Designation] == "") and ( params[:tf_Company] == "")
#       @user = User.find(:all,:conditions=>['"user_Zip" = ? and "id" != ? ',params[:tf_Zip], current_user.id])
    #interest
#    elsif (params[:tf_Zip] == "") and ( !params[:Interest].blank? or params[:Interest] != "1" ) and (params[:tf_Designation] == "") and (params[:tf_Company] == "")
#       @user = User.find(:all,:conditions=>['"user_Need" = ? and "id" != ? ',params[:Interest], current_user.id])   
    #designation
#    elsif (params[:tf_Zip] == "") and ( !params[:Interest].blank? or params[:Interest] == "1" ) and ( !params[:tf_Designation].blank? or params[:tf_Designation] !="" ) and (params[:tf_Company] =="")
#       @user_join = Profession.joins(:user).where('"professions"."Designation" = ? and "professions"."UserID" != ? ', params[:tf_Designation], current_user.id)
    #company
#    elsif (params[:tf_Zip] == "") and ( !params[:Interest].blank? or params[:Interest] == "1" ) and (params[:tf_Designation] == "") and ( !params[:tf_Company].blank? or params[:tf_Company] !="" )
#       @user_join = Profession.joins(:user).where('"professions"."Company" =? and "professions"."UserID" != ?', params[:tf_Company], current_user.id)
    #ZipInterest
#    elsif ( !params[:tf_Zip].blank? or params[:tf_Zip] !="" )  and ( !params[:Interest].blank? or params[:Interest] !="1" ) and (params[:tf_Designation] == "") and (params[:tf_Company] == "")
 #      @user = User.find(:all, :conditions => ['"user_Zip" = ? AND "user_Need" = ? and "id" != ? ',params[:tf_Zip], params[:Interest], current_user.id])
    #ZipDesignation
#    elsif ( !params[:tf_Zip].blank? or params[:tf_Zip] !="" ) and ( !params[:Interest].blank? and  params[:Interest] == "1" ) and ( !params[:tf_Designation].blank? or params[:tf_Designation] !="" ) and (params[:tf_Company] == "")
#        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "professions"."Designation"= ? and "professions"."UserID" != ? ',params[:tf_Zip],params[:tf_Designation], current_user.id)
    #ZipCompany
#    elsif ( !params[:tf_Zip].blank? or params[:tf_Zip] !="" )  and ( !params[:Interest].blank? and  params[:Interest] == "1" ) and (params[:tf_Designation] == "")  and ( !params[:tf_Company].blank? or params[:tf_Company] !="" )
#        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "professions"."Company" = ? and "professions"."UserID" != ? ', params[:tf_Zip], params[:tf_Company], current_user.id)   
    #InterestDesignation
#    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( !params[:tf_Designation].blank? or params[:tf_Designation] !="" ) and ( params[:tf_Company] == "" )
#        @user_join = Profession.joins(:user).where('"users"."user_Need" = ? AND "professions"."Designation"= ? and "professions"."UserID" != ? ',params[:Interest],params[:tf_Designation], current_user.id)
    #InterestCompany
#    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] =="" ) and ( params[:tf_Company] != "" )
#        @user_join = Profession.joins(:user).where('"users"."user_Need" = ? AND "professions"."Company"= ? and "professions"."UserID" != ?',params[:Interest],params[:tf_Company], current_user.id)
    #DesignatinCompany
#    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] =="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] != "" )
#        @user_join = Profession.joins(:user).where('"professions"."Designation" = ? AND "professions"."Company"= ? and "professions"."UserID" != ? ',params[:tf_Designation], params[:tf_Company], current_user.id)
    #ZipInterestDesignation
#    elsif (params[:tf_Zip] !="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] == "" )
#        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "users"."user_Need" = ? AND "professions"."Designation"= ? and "professions"."UserID" != ? ',params[:tf_Zip], params[:Interest], params[:tf_Designation], current_user.id)
    #ZipInterestCompany    
#    elsif (params[:tf_Zip] !="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] =="" ) and ( params[:tf_Company] != "" )
#        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "users"."user_Need" = ? AND "professions"."Company"= ? and "professions"."UserID" != ? ',params[:tf_Zip], params[:Interest], params[:tf_Company], current_user.id)
    #InterestDesignationCompany
#    elsif (params[:tf_Zip] =="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] != "" )
#        @user_join = Profession.joins(:user).where('"users"."user_Need" = ? AND "professions"."Designation"= ? AND "professions"."Company" = ? and "professions"."UserID" != ? ', params[:Interest], params[:tf_Designation], params[:tf_Company], current_user.id)
   
#    else (params[:tf_Zip] !="" ) and ( !params[:Interest].blank? or params[:Interest] !="1" )  and ( params[:tf_Designation] !="" ) and ( params[:tf_Company] != "" )
#        @user_join = Profession.joins(:user).where('"users"."user_Zip" = ? AND "users"."user_Need" = ? AND "professions"."Designation"= ? AND "professions"."Company"= ? and "professions"."UserID" != ?',params[:tf_Zip], params[:Interest], params[:tf_Designation], params[:tf_Company], current_user.id)
 
    zip=params[:tf_Zip] unless params[:tf_Zip]==""
    interest=params[:interest] unless params[:interest]==""
    societies=params[:societies] unless params[:societies]==""
    sector= params[:workSector] unless params[:workSector]==""
    partner=params[:partnership] unless params[:partnership]==""
    desig=params[:tf_Designation] unless params[:tf_Designation]==""
    company=params[:tf_Company] unless params[:tf_Company]==""

    if zip.nil? and interest.nil? and societies.nil? and sector.nil? and partner.nil? and desig.nil? and company.nil?


    elsif desig.nil? and company.nil?
      @user = User.find(:all, :conditions => ['(? is null or "users"."user_Zip" = ?) AND ((?) is null or "users"."interest" in (?)) AND (? is null or "users"."societies" = ?) AND (? is null or "users"."sector" = ?) AND (? is null or "users"."partnership" =?) AND "users"."id" != ?', zip,zip,interest,interest,societies,societies,sector,sector,partner,partner,current_user.id])
    else
      @user_join = Profession.joins(:user).where('(? is null or "users"."user_Zip" = ?) AND (? is null or "users"."interest" = ?) AND (? is null or "users"."societies" = ?) AND (? is null or "users"."sector" = ?) AND (? is null or "users"."partnership" =?) AND (? is null or "professions"."Designation"= ?) AND  (? is null or "professions"."Company"= ?) AND "professions"."UserID" != ?', zip,zip,interest,interest,societies,societies,sector,sector,partner,partner,desig,desig,company,company, current_user.id)
    end
       
  	#end   	
  	    render 'search'
  end 
end