class CommunicationsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
      if params[:Communication][:chkbx_Phone] == "1"
      	 @Phone = "Phone"
      	 @detail = params[:Communication][:tf_Phone]
      	 @Phone_Public = params[:Communication][:chkbx_Phone_Public]
         @Phone_Preferred = params[:Communication][:rb_Phone_Preferred]
         @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @detail, :Private => @Phone_Public, :Preferred => @Phone_Preferred)
         @communication.save
     end

     if params[:Communication][:chkbx_Email] == "1"
      	 @Phone = "Email"
      	 @detail = params[:Communication][:tf_Email]
      	 @Phone_Public = params[:Communication][:chkbx_Email_Public]
         @Phone_Preferred = params[:Communication][:rb_Email_Preferred]
         @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @detail, :Private => @Phone_Public, :Preferred => @Phone_Preferred)
         @communication.save
     end

     if params[:Communication][:chkbx_Skype] == "1"
      	 @Phone = "Skype"
      	 @detail = params[:Communication][:tf_stype]
      	 @Phone_Public = params[:Communication][:chkbx_Skype_Public]
         @Phone_Preferred = params[:Communication][:rb_Skype_Preferred]
         @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @detail, :Private => @Phone_Public, :Preferred => @Phone_Preferred)
         @communication.save
     end

     if params[:Communication][:chkbx_Website] == "1"
      	 @Phone = "Website"
      	 @detail = params[:Communication][:tf_Website]
      	 @Phone_Public = params[:Communication][:chkbx_Website_Public]
         @Phone_Preferred = params[:Communication][:rb_Website_Preferred]
         @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @detail, :Private => @Phone_Public, :Preferred => @Phone_Preferred)
         @communication.save
     end

     if params[:Communication][:chkbx_Twitter] == "1"
      	 @Phone = "Twitter"
      	 @detail = params[:Communication][:tf_Twitter]
      	 @Phone_Public = params[:Communication][:chkbx_Twitter_Public]
         @Phone_Preferred = params[:Communication][:rb_Twitter_Preferred]
         @communication=Communication.new( :UserID => current_user.id, :CommunicationMode => @Phone, :CommunicationDetail => @detail, :Private => @Phone_Public, :Preferred => @Phone_Preferred)
         @communication.save
     end
     redirect_to '/professions'
  end

  def new
	@communication = Communication.new
  end

  def destroy
  end
end
