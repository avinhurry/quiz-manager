class Question < ApplicationRecord
  belongs_to :quiz, optional: true
end
