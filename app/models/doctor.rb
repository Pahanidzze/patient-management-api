class Doctor < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: NAME_LENGTH }
  validates :last_name, presence: true, length: { maximum: NAME_LENGTH }
  validates :middle_name, length: { maximum: NAME_LENGTH }, allow_blank: true

  has_many :doctor_patients, dependent: destroy
  has_many :patients, through: :doctor_patients
end
