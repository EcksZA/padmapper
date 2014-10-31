class PropertiesController < ApplicationController
	def index
		@properties = Property.all
	end

	# def show
	# 	@user = User.find(params[:user_id])
	# 	@property = @user.properties.find(params[:id])
	# 	redirect_to user_path(@user)
	# end

	def new
		@user = User.find(params[:user_id])
		@property = @user.properties.new
	end

	def create
		@user = User.find(params[:user_id])
		@property = @user.properties.new(property_params)
		if @property.save
			respond_to do |format|
				format.html { redirect_to new_user_property_path(@user) }
				format.js
			end
		else
			flash[:notice] = 'An Error Occurred. Please Try Input Again.'
			redirect_to user_path(@user)
		end
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
			respond_to do |format|
				format.html { redirect_to user_property_path(@user, @property) }
				format.js
			end
		else
			redirect_to user_path(@user)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@property = @user.properties.find(params[:id])
		@property.destroy
		flash[:notice] = "The Property Has Been Deleted"
		redirect_to user_path(@user)
	end

private
	def property_params
		params.require(:property).permit(:address, :price, :bedroom, :bathroom, :photo)
	end
end