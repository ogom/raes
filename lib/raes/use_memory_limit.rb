# frozen_string_literal: true

module Raes
  module UseMemoryLimit
    extend ActiveSupport::Concern

    included do
      def memsize
        GetProcessMem.new(Process.pid).mb.ceil
      end

      def memsize_with_gc
        size = memsize
        if !memory_limit.zero? && size > memory_limit
          GC.start
          size = memsize
        end
        size
      end
    end

    private

    def memory_limit
      @memory_limit ||= Raes.config.dig(:concern, :memory_limit).to_i
    end
  end
end
