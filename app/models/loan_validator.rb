class LoanValidator < ActiveModel::Validator
  def validate(loan)
    unless loan.item.is_available?
      loan.errors[:item_id] << "Sorry, this item is currently not available!"
    end
  end
end
