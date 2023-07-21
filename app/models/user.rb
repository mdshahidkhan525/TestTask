class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable, :timeoutable
  validate :age_must_be_eighteen_or_above

  private

  def age_must_be_eighteen_or_above
    if birth_date.present? && birth_date >= 18.years.ago.to_date
        errors.add(:birth_date, 'Age should be over 18 years old')
    end
  end
end
