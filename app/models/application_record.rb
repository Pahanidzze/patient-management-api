class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  GENDERS = %w[ male female other ].freeze
  NAME_LENGTH = 100.freeze
end
