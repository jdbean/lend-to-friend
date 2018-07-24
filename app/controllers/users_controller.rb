class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:name).page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)

    if @user.valid?
      flash[:success] = "Successfully updated!"
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :street_address, :city, :state, :zipcode, :avatar)
  end
end
