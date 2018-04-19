class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :get_loan, only: [:update, :rating]
  before_action :get_user, only: [:index, :create, :update]

  def index
    @loans = @user.loans
    @current_loans = @loans.select { |loan| !loan.item.is_available? && loan.returned == nil }
    @previous_loans = @loans.select { |loan| loan.item.is_available? || loan.returned != nil }
  end

  def create
    @item = Item.find(loan_params[:item_id])
    @loan = Loan.new(loan_params)
    @loan.borrower = current_user
    @loan.loaned = Time.now

    if @loan.save
      flash[:success] = "You have successfully borrowed this item!"
      redirect_to user_loans_path(@user)
    else
      flash[:errors] = @loan.errors.full_messages
      redirect_to @item
    end
  end

  def rating
  end

  def update
    @loan.rating = loan_params[:rating]
    @loan.returned = Time.now
    if @loan.save
      flash[:success] = "You have successfully returned this item!"
      redirect_to user_loans_path(@user)
    else
      flash[:errors] = @loan.errors.full_messages
      render :rating
    end
  end

  private

  def get_user
    @user = current_user
  end

  def get_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:item_id, :borrower_id, :loaned, :returned, :rating)
  end
end
