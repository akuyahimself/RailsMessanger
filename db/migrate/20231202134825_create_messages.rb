# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
