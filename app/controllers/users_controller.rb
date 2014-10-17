class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @users = User.where.not(id: current_user.id)
    @following_relationship = FollowingRelationship.new
  end

  def show
    @user = User.find_by(username: params[:username])
    @followed_users = @user.followed_users
    @favorite_shouts = @user.favorite_shouts
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end

