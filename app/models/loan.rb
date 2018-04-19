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
  def type
    if self.item
      self.item.type
    end
  end
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
  def self.with_type
    Loan.all.map do |l|
      {type: l.type, data: l}
    end
  end

  def self.grouped_by_type
    array = self.with_type
    group_hash = {}

    array.each do |loan_hash|
      key = loan_hash[:type]
      data = loan_hash[:data]

      if group_hash.has_key?(key)
        group_hash[key] << data
      else
        group_hash[key] = []
        group_hash[key] << data
      end
    end
    group_hash
  end

  def self.loan_type_array
    loan_hash = self.grouped_by_type
    pairing_array = []

    loan_hash.each_pair do |k,v|
      new_hash = {}
      new_hash[:name] = k
      new_hash[:data] = v
      pairing_array << new_hash
    end
    pairing_array
  end

  # output[0][:data].group_by_day(&:loaned)



  #
  # def self.group_by_type
  #   self.with_type.group_by{|h| h[:type]}.values
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
