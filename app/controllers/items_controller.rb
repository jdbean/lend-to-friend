class ItemsController < ApplicationController
  before_action :get_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

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
    @item = Item.update(item_params)

    if @item.valid?
      redirect_to @item
    else
      flash[:errors] = @item.errors.full_messages
      redirect_to edit_item_path
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def get_item
    @item = Item.find(params[:id])
  end

  def item_params
    #VICKY: check param names
    params.require(:item).permit(:name, :picture, :genre, :author, :description, :user_id)
  end
end
