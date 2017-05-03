module SessionsHelper

	# Log in a given user
	def log_in(user)
		session[:user_id] = user.id
	end

	# Return the current logged-in user
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Return the user if logged in
	def logged_in?
		!current_user.nil?
	end
end
