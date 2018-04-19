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
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, on: :update

  attr_accessor :type

  # def item_is_available?
  #   self.item.is_available?
  # end

  def checked_out_on?(datetime)
    if self.returned
      ret = self.returned
    else
      ret = Time.now
    end
    (self.loaned..ret).include?(datetime)
  end

  # def item_type
  #   if self.item
  #     self.item.type
  #   end
  # end
  #
  # def type
  #   if self.item
  #     self.item.type
  #   end
  # end
  #
  # def self.chart
  #   self.joins(:item).map {|loan|
  #     {type: loan.item_type, data: loan.loaned}
  #   }
  # end



  # def self.item_type_by_day
  #   array = []
  #   hash = {}
  #   self.all.each do |loan|
  #     if !array.include?(loan.item_type)
  #       hash[:name] = loan.item_type
  #       []
  #     end
  #     hash[loan.item_type] << loan.loaned
  #   end
  #   hash
  # end

  # def self.by_type
  #   self.group(type)
  # end
  #
  # def self.with_type
  #   Loan.all.map do |l|
  #     {type: l.type, data: l}
  #   end
  # end
  #
  # def self.group_by_type
  #   self.with_type.group_by{|h| h[:type]}.values
  # end
end
