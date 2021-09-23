# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :quiz, optional: true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true, limit: 5, reject_if: proc { |att| att['name'].blank? }
end
