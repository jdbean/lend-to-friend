class Loan < ApplicationRecord
  belongs_to :item
  belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"
end
