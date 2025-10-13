class Patient < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: NAME_LENGTH }
  validates :last_name, presence: true, length: { maximum: NAME_LENGTH }
  validates :middle_name, length: { maximum: NAME_LENGTH }, allow_blank: true
  validates :birthday, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :height, presence: true, numericality: {
    only_integer: true,
    greater_then: 0 }
  validates :weight, presence: true, numericality: {
    greater_then: 0
  }

  # Patient uniqueness.
  validates :birthday, uniqueness: {
    scope: [ :first_name, :last_name, :middle_name ],
    case_sensitive: false,
    message: "patient with same name and birthday already exists"
  }

  has_many :doctor_patients, dependent: :destroy
  has_many :doctors, through: :doctor_patients
  has_many :bmr_calculations, dependent: :destroy

  def full_name
    [ first_name, last_name, middle_name ].compact.join(" ")
  end

  def age
    return nil unless birthday

    today = Date.current
    result = today.year - birthday.year

    result -= 1 unless birthday_this_year?

    result
  end

  def birthday_this_year?
    today = Date.current

    today.month > birthday.month || (today.month == birthday.month && today.day > birthday.day)
  end
end
