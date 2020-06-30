# frozen_string_literal: true

class CreateRaesStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :raes_storages do |t|
      t.integer :status, null: false, default: 0, index: true
      t.string :name, null: false, default: '', index: true
      t.references :record, null: false, polymorphic: true

      t.timestamps
    end
    add_index :raes_storages, %i[status name]
  end
end
