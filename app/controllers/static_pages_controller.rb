class StaticPagesController < ApplicationController
  def home
  end

  def default
  end

  def reject
    requestfrom = Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?',current_user.id,params[:id], "0")
    requestfrom.first.update_attribute(:IsApproved, "2")
    redirect_to '/default'
  end

  def reject1
    requestfrom = Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?',params[:id], current_user.id, "1")
    requestfrom.first.update_attribute(:IsApproved, "2")
    requestto= Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?',current_user.id,params[:id],"1")
    requestto.first.update_attribute(:IsApproved, "2")
    redirect_to '/default'
  end

  def update
    requestfrom = Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?',params[:id], current_user.id, "0")
    requestfrom.first.update_attribute(:IsApproved, "2")
    redirect_to '/default'
  end

  def creates
    requestfrom = Userrequest.where('"RequestFrom" = ? AND "RequestTo" = ? AND "IsApproved" = ?', params[:id], current_user.id, "0")
    #requestfrom = @user.RequestFrom
    #Userrequest.update_attributes( :RequestFrom => requestfrom, :RequestTo => current_user.id, :IsApproved => "1")
    @user_request = Userrequest.new( :RequestFrom => current_user.id , :RequestTo => params[:id] , :IsApproved => "1")
    requestfrom.first.update_attribute(:IsApproved, "1")
    @user_request.save
    redirect_to '/default'
  end

  def pending_request
    @user = Userrequest.select('"RequestFrom"').where('"RequestTo" = ? AND "IsApproved" = ?', current_user.id, "0")
  end

  def request_I_have_sent
    @user = Userrequest.select('"RequestTo"').where('"RequestFrom" = ? AND "IsApproved" = ?', current_user.id ,"0")
  end
  def connections
  	@user = Userrequest.select('"RequestFrom"').where('"RequestTo" = ? AND "IsApproved" = ?', current_user.id, "1")
  end
end
