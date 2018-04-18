class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item, only: [:show, :edit, :update]

  def index
    @books = Book.all
    @games = Game.all
    @movies = Movie.all
    @household_items = Household.all
    @clothing_items = Clothing.all
  end

  def show
    @user = User.find(@item.user_id)
  end

  def new
    @type = params[:type]
    @user = User.find(params[:user_id])
    @item = @user.send(@type.downcase.pluralize).new
  end

  def create
    @type = params[:item][:type].downcase
    @user = current_user

    @item = @user.send(@type.pluralize).create(item_params)
    if @item.valid?
      redirect_to @item
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to "/users/#{@user.id}/#{@type.pluralize}/new"
    end
  end

  def edit
  end

  def update
    @item.update(item_params)

    if @item.valid?
      redirect_to @item
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to edit_item_path
    end
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to items_path
  end


  private

  def get_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :image, :genre, :author, :description, :user_id, :type)
  end
end
