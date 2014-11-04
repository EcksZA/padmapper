class SessionsController < ApplicationController
	def new
		respond_to do |format|
			format.html { redirect_to login_path }
			format.js
		end
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			respond_to do |format|
				format.html { redirect_to root_url }
				format.js
				session[:user_id] = @user.id
				flash[:notice] = 'Logged In'
			end	
		else
			flash[:alert] = 'Email or password is invalid'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out"
		redirect_to root_url
	end
end