class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin


	def require_admin
  		unless current_user.try(:admin?)
			redirect_to root_path, alert: "Você não tem autorização para acessar isso."
  		end
	end

	def index
		@users = User.all
  	end


	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path, notice: "Usuário foi apagado"
	end

	def edit
		@user = User.find(params[:id])
	end


	def update
	  @user = User.find(params[:id])
	 
	  if @user.update(user_params)
	    redirect_to users_path
	  else
	    redirect_to users_path, notice: "Usuário não pode ser editado"
	  end
	end

  	private
  		def user_params
    		params.require(:user).permit(:username, :email, :admin)
  		end
	end
