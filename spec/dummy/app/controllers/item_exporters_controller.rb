# frozen_string_literal: true

class ItemExportersController < ApplicationController
  def index
    @actions = Raes.search(ItemExporter).order(created_at: :desc).limit(11)
  end

  def create
    Raes.dispatch(ItemExporter, raes_storage: item_exporter_params[:file])
    redirect_to item_exporters_url, notice: 'ItemExporter action was successfully created.'
  end

  private

  def item_exporter_params
    { file: { io: StringIO.new, filename: 'items.csv', content_type: 'text/csv' } }
  end
end
