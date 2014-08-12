class InternshipsController < ApplicationController
  def new
  end

  def create
  	@internship=Internship.new(:Title => params[:name],:Location => params[:location],:Description => params[:description],:CompanyID => current_user.id)
  	@internship.save
  	redirect_to internships_path
  end

  def index
  	if current_user.Account=="company"
      @internship=Internship.where(:CompanyID => current_user.id)
    elsif current_user.Account=="normal"
      @internship=Internship.joins("INNER JOIN intern_users ON intern_users.internship_id=internships.id").where("ApplicantID = ?",current_user.id)  
    end
  end

  def show
  	@internship=Internship.find(params[:id])
  	@internusers=InternUser.joins("INNER JOIN internships ON intern_users.internship_id=internships.id").where("internship_id = ?",params[:id])

  end

  def openings
    @title=params[:tf_Internship] unless params[:tf_Internship]==""
    if !@title.nil?
      @internship=Internship.find(:all, :conditions => ['"Title" LIKE ? or "Description" LIKE ? or "Location" LIKE ?',"%#{@title}%","%#{@title}%","%#{@title}%"])
    end
  end

  def upload
    s=params[:internships][:file]
    File.open(Rails.root.join('public', 'resume', s.original_filename.to_s.split('.')[0]+""+current_user.id.to_s+"."+s.original_filename.to_s.split('.')[1]), 'wb') do |file|
      file.write(s.read)
      path="/resume/"+ s.original_filename.to_s.split('.')[0]+""+current_user.id.to_s+"."+s.original_filename.to_s.split('.')[1]
      @applicant=InternUser.new(:resume_path => path, :internship_id => params[:id],:ApplicantID => current_user.id)
      @applicant.save
    end
    redirect_to internships_path
  end
end