class SessionsController < ApplicationController
	def new
  end
  
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log in and display relevant page
  	else
  		# create an error message
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
		end
	end

	def destroy
	end
end
