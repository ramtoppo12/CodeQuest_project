class UsersController < ApplicationController

	def register
		@user=User.new
	end

	def show
  	end

	def create
  	@user =User.new(user_params)
  	if @user.save
      log_in @user
  		redirect_to '#about'
  	else
  		render 'register'
  	end
  	end

  	private
   	def user_params
   		params.require(:user).permit(:name, :email , :phone_number,:password, :password_confirmation)
   	end

end
