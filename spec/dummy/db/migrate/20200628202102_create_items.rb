# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :status, null: false, default: 0
      t.string :code, null: false, default: ''
      t.string :name, null: false, default: ''

      t.timestamps
    end
  end
end
