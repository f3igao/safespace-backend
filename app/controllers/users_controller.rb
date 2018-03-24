class UsersController < ApplicationController
  def index

    if params[:name]
      @user = User.find_by(username:params[:name])
      render json: @user
    else
      @users = User.all
      render json: @users
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
