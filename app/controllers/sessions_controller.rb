class SessionsController < ApplicationController

	def new
	end

	def new1
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to '/default'
	    else
	    	flash.now[:error] = 'Invalid email/password combination'
	    	render 'new'
	    end
	end

	def destroy 
		cookies.delete(:auth_token)
		sign_out
		redirect_to root_url
	end
end
