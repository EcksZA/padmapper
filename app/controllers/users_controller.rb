class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		render('users/show.html.erb')
	end

	def new
		@user = User.find(params[:id])
		render('users/new.html.erb')
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = 'Your New Account Has Been Created'
			redirect_to('users/show')
		else
			render('users/new.html.erb')
		end
	end

	def edit
		@user = User.find(params[:id])
		render('users/edit.html.erb')
	end

	def update
		@user = User.find(params[:id])
		if @user.update(params[:user])
			flash[:notice] = 'Your Account Has Been Updated'
			redirect_to('users/show.html.erb')
		else
			render('users/edit.html.erb')
		end

	def destroy
		@user = User.find(params[:id])
		@user.delete
		flash[:notice] = 'Your Account Has Been Removed'
		render('user/index.html')
	end
end