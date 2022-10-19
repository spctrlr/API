class UsersController < ApplicationController

  before_action :set_user, only: %i[ show update destroy ]

  def show
    if @user
      render json: { data: @user }, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      token = encode_token( {user_id: @user.id} )
      render json: { user: @user, jwt: token}, status: :created
    else
      render json: 'Invalid username or password', status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { message: 'User updates successfully', data: @user }, status: :ok
    else
      render json: { message: 'User not found' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy!
      render json: { message: 'User was deleted successfully' }, status: :no_content
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      token = encode_token( {user_id: @user.id} )
      render json: { user: @user, jwt: token}, status: :ok
    else
      render json: 'Invalid username or password', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
