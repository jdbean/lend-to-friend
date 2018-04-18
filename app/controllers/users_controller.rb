class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    # @users = User.all
    @users = User.order(:name).page params[:page]
  end

  def show
    # Add items to lend here?
  end

  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.create(user_params)
  #
  #   if @user.valid?
  #     redirect_to @user
  #   else
  #     flash[:errors] = @user.errors.full_messages
  #     redirect_to new_user_path
  #   end
  # end

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

  # def destroy
  #   @user.destroy
  #   redirect_to root_path
  # end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :street_address, :city, :state, :zipcode, :avatar)
  end
end
