class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item, only: [:show, :edit, :update]

  def index
    @books = Book.all.first(4)
    @games = Game.all.first(4)
    @movies = Movie.all.first(4)
    @household_items = Household.all.first(4)
    @clothing_items = Clothing.all.first(4)
  end

  def books
    @books = Book.order(:title).page params[:page]
    render :books
  end

  def movies
    @movies = Movie.order(:title).page params[:page]
    render :movies
  end

  def games
    @games = Game.order(:title).page params[:page]
    render :games
  end

  def households
    @households = Household.order(:title).page params[:page]
    render :households
  end

  def clothings
    @clothings = Clothing.order(:title).page params[:page]
    render :clothings
  end

  def show
    @user = User.find(@item.user_id)
  end

  def new
    @type = params[:type]
    @user = User.find(params[:user_id])
    @item = @user.send(@type.downcase.pluralize).new
    @item[:image] = "http://via.placeholder.com/300x300"
  end

  def create
    @type = params[:item][:type].downcase
    @user = current_user

    @item = @user.send(@type.pluralize).create(item_params)
    if @item.valid?
      flash[:success] = "Item added!"
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
      flash[:success] = "Item edited!"
      redirect_to @item
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to edit_item_path
    end
  end

  private

  def get_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :image, :genre, :author, :description, :user_id, :type)
  end
end
