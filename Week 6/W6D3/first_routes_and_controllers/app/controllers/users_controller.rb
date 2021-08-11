class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: { error: 'There is no user at that ID' }, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    @user.user_id = User.first.id
    if @user.save
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end
end
