# == Schema Information
#
# Table name: loans
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  borrower_id :integer
#  rating      :integer
#  loaned      :datetime
#  returned    :datetime
#  overdue     :boolean          default(FALSE)
#
# Indexes
#
#  index_loans_on_borrower_id  (borrower_id)
#  index_loans_on_item_id      (item_id)
#

class Loan < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :item
  belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"
  validates_with LoanValidator, on: :create
  validates :loaned, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, on: :update, if: :return_requested?

  # def item_is_available?
  #   self.item.is_available?
  # end

  def return_requested?
    self.returned != nil
  end

  def due_date
    (self.loaned + 7.days).strftime("%b %d, %Y")
  end

  def overdue?
    self.due_date < Time.now
  end
end
