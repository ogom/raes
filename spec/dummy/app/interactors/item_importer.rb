# frozen_string_literal: true

require 'csv'

class ItemImporter < ApplicationInteractor
  def initialize(params)
    @raes_storage_id = params[:raes_storage_id]
    @attributes = %w[id code name]
  end

  def call
    records = CSV.parse(raes_storage_content, headers: true)
    records.each do |record|
      item = Item.find_or_initialize_by(code: record['code'])
      item.update(record.to_hash.slice(*@attributes))
    end

    { message: { count: records.count } }
  end
end
