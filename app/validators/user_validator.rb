# frozen_string_literal: true

class UserValidator < ActiveModel::Validator
  def validate(record)
    return if record.birth_date.present? && record.birth_date <= 18.years.ago.to_date

    record.errors.add(:birth_date, 'Age should present and be over 18 years old')
  end
end
