class UsersController < ApplicationController
  def index
    # @users = User.all
    # render json: @users
    # debugger
    if params[:search]
      @user = User.where('username LIKE ?', "%#{params[:search]}%")
    else
      @user = User.all
    end

    render json: @user
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
    # @user.id = User.first.id
    if @user.save
      redirect_to users_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    unless @user
      render json: { error: 'There is no user with that id.' }, status: 404
      return
    end

    if @user.update(user_params)
      redirect_to users_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy

      redirect_to '/users'
    else
      render json: { error: 'There is no user with that id.' }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
            # ^ what we are receving must be wrapped/structured as a user obj
            # ^ we can only have these, must have these, filter out other params
  end
end
