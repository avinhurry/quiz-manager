# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
