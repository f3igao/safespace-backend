class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def index

    if params[:name]
      @user = User.find_by(username:params[:name])
      render json: @user
    else
      @users = User.all
      render json: current_user
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      # SUCCESSFUL CREATION
      payload = { user_id: @user.id}
      render json: {user: UserSerializer.new(@user), token: issue_token(payload)}
    else
      render json: {message: "Sucks to suck"}
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
