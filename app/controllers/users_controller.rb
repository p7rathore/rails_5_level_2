class UsersController < ApplicationController
	before_action :require_signin, except: [:new,:create] 
	before_action :require_correct_user, only: [:edit, :update, :destroy]

	def index
		@users = User.all 
	end

	def show
		@user = User.find(params[:id])
		@registrations = @user.registrations
		@liked_events = @user.liked_events
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user), notice: "Account successfully Created!"
		else
			render :new
		end
	end

	def edit
		# @user = User.find(params[:id])
	end

	def update
		# @user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "Account successfully updated!"
		else
			render :edit
		end
	end

	def destroy
		# @user = User.find(params[:id])
		@user.destroy
		session[:user_id] = nil
		redirect_to users_path, notice: "Your Account successfully Deleted!"
	end

	private

		def require_correct_user
			@user = User.find(params[:id])
			unless current_user?(@user)
				redirect_to root_url
			end

		end
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end


end
