# frozen_string_literal: true

class CreateRaesActions < ActiveRecord::Migration[6.0]
  def change
    create_table :raes_actions do |t|
      t.integer :status, null: false, default: 0, index: true
      t.string :name, null: false, default: '', index: true
      t.json :payload, null: false, default: {}
      t.json :state, null: false, default: {}

      t.timestamps
    end
    add_index :raes_actions, %i[status name]
  end
end
