class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @games = Game.all
    @movies = Movie.all
    @household_items = HouseholdItem.all
    @clothing_items = ClothingItem.all
  end

  def show
  end

  def new
    byebug
    @user = User.find(params[:user_id])
    @item = @user.send(set_type.pluralize).new
  end

  def create
    byebug
    @user = User.find(params[:user_id])
    @item = @user.send(set_type.pluralize).create(item_params)

    if @item.valid?
      redirect_to @item
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to new_item_path
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
    @item.destroy
    redirect_to @user
  end

  private

  def get_item
    @item = Item.find(params[:id])
  end

  def set_item
    @user = User.find(params[:user_id])
    @item = @user.send(set_type.pluralize).find(params[:id])
  end

  def set_type
    case params[:type]
    when 'Book'
      'book'
    when 'Game'
      'game'
    when 'Movie'
      'movie'
    when 'HouseholdItem'
      'household_item'
    when 'ClothingItem'
      'clothing_item'
    end
  end

  def item_params
    params.require(set_type.to_sym).permit(:title, :image, :genre, :author, :description, :user_id)
  end
end
