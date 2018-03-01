class UsersController < ApplicationController
  # def new
	before_action :user_params, only: [:create, :update]
  # end
  	def index
    	render json: @user = User.all
 	end
 	
	 def show
	  render json: @user = User.find(params[:id])
	 end
	 def new
	  @user = User.new
	 end

	 def create
	  @user = User.new(user_params)

	  # if @user.save
	  # 	render json: @user, status: :created_successfully
	  # else
	  # 	render json: @user.errors.full_messages
	  # end
	  if @user.save
	  	 render json: @user, status: :created
	  else
	  	render json: @user.errors.full_messages
	  end
	 end

	 def name
	 	render json: User.column_names
	 end

	 def allusername
	 	render json: User.all.collect(&:name)
	 end

	 def destroy
	 	@user = User.find(params[:id])
	 	if @user.destroy
	 		render json: @user
	 	else
	 		 render json: @user.errors.full_messages
	 	end
	 end

	 	def update
		 	@user = User.find(params[:id])
		 	if @user.update(user_params)
	      render json: @user
	    else
	      render json: @user.errors, status: :unprocessable_entity
	    end
	 	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :subname, :password)
	end
end
