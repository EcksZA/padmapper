class UsersController < ApplicationController
	before_action :authorize, only: [:edit, :update, :destroy]
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		render 'users/show.html.erb'
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = 'Your New Account Has Been Created'
			redirect_to user_path(@user)
		else
			render 'users/new.html.erb'
		end
	end

	def edit
		@user = User.find(params[:id])
		render 'users/edit.html.erb'
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = 'Your Account Has Been Updated'
			redirect_to user_path(@user)
		else
			render 'users/edit.html.erb'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.delete
		flash[:notice] = 'Your Account Has Been Removed'
		redirect_to users_path
	end

private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :company, :work_phone, :cell_phone, :email, :password, :password_confirmation)
	end
end