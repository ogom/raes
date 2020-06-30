# frozen_string_literal: true

class FileMaker < ApplicationInteractor
  def initialize(params)
    @raes_storage_id = params[:raes_storage_id]
  end

  def call
    old_file = raes_storage_content
    new_file = old_file + 'bar'

    raes_storage_attach({ io: StringIO.new(new_file), filename: 'new_file.txt', content_type: 'text/plain' })
  end
end
