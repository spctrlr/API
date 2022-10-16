class UsersController < ApplicationController

  def index
    @users = User.all

    if @users
      render json: { status: "SUCCESS", data: @users }, status: :ok
    else
      render json: @user.errors, status: :not_found
    end
  end

  def show
    @user = User.find(params[:id])
    
    if @user
      render json: { data: @user }, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token( {user_id: @user.id} )
      render json: { user: @user, jwt: token}, status: :ok
    else
      render json: 'Invalid username or password', status: :unprocessable_entity
    end
  end

  # Not working
  def edit
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      render json: { message: 'User updates successfully', data: @user }, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def login
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      token = encode_token( {user_id: @user.id} )
      render json: { user: @user, jwt: token}, status: :ok
    else
      render json: 'Invalid username or password', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
