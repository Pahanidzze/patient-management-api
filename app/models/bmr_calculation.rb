class BmrCalculation < ApplicationRecord
  belongs_to :patient

  FORMULAS = %w[ mifflin_st_jeor harris_benedict ].freeze

  validates :patient, presence: true
  validates :formula, presence: true, inclusion: { in: FORMULAS }
  validates :value, presemce: true, numericality: { greater_then: 0 }
end
