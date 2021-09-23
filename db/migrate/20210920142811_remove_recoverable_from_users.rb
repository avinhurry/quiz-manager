# frozen_string_literal: true

class RemoveRecoverableFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
  end

  def down
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
  end
end
