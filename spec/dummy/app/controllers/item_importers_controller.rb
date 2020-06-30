# frozen_string_literal: true

class ItemImportersController < ApplicationController
  def index
    @actions = Raes.search(ItemImporter).order(created_at: :desc).limit(11)
  end

  def create
    Raes.dispatch(ItemImporter, raes_storage: item_importer_params[:file])
    redirect_to item_importers_url, notice: 'ItemImporter action was successfully created.'
  end

  private

  def item_importer_params
    params.require(:item_importer).permit(:file)
  end
end
