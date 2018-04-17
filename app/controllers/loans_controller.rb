class LoansController < ApplicationController
  before_action :authenticate_user!

  before_action :get_loan, only: [:show, :edit, :update]

  def index
    @loans = Loan.all
    #analytics page?
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.create(loan_params)

    if @loan.valid?
      redirect_to @loan
    else
      flash[:errors] = @loan.errors.full_messages
      redirect_to new_loan_path
    end
  end

  def edit
  end

  def update
    @loan.update(loan_params)

    if @loan.valid?
      redirect_to @loan
    else
      flash[:errors] = @loan.errors.full_messages
      redirect_to edit_loan_path
    end
  end

  private

  def get_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:item_id, :borrower_id, :loaned, :returned)
  end
end
