class PropertiesController < ApplicationController
	def index
		@properties = Property.all
		redirect_to root_path
	end

	def show
		@user = User.find(params[:user_id])
		@property = @user.properties.find(params[:id])
		redirect_to user_path(@user)
	end

	def new
		@user = User.find(params[:user_id])
		@property = @user.properties.new
	end

	def create
		@user = User.find(params[:user_id])
		@property = @user.properties.new(property_params)
	end

	def edit
		@user = User.find(params[:user_id])
		@property = @user.properties.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@property = @user.properties.find(params[:id])
		if @property.update(property_params)
			flash[:notice] = "Property Details Have Been Updated"
		else
			redirect_to user_path(@user)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@property = @user.properties.find(params[:id])
		flash[:notice] = "The Property Has Been Deleted"
		redirect_to user_path(@user)
	end

private
	def property_params
		params.require(:propery).permit(:address, :price, :bedroom, :bathroom)
	end
end