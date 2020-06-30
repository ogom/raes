# frozen_string_literal: true

require 'csv'

class ItemExporter < ApplicationInteractor
  def initialize(params)
    @raes_storage_id = params[:raes_storage_id]
    @attributes = %i[id code name]
  end

  def call
    csv = CSV.generate { |row| add_row(row) }
    raes_storage_attach({ io: StringIO.new(csv), filename: 'items.csv', content_type: 'text/csv' })
    { message: { count: csv.count("\n").pred } }
  end

  def add_row(row)
    cursor = 0
    batch_size = 1000
    row << @attributes
    loop do
      records = Item.order(:code).limit(batch_size).offset(cursor).pluck(*@attributes)
      records.each { |record| row << record }
      cursor += batch_size
      break if records.empty?
    end
  end
end
