class Collection < ApplicationRecord

  scope :created_between, ->(from_date, to_date, code) {
    if from_date.present? && to_date.present? && code.present?
      where("date >= ? AND date <= ? AND code = ?", from_date, to_date, code)
    else
      none
    end
  }
end
