# frozen_string_literal: true

module Raes
  class ContextLogger
    def initialize(class_name)
      @class_name = class_name
      @logger_class = logger_class
    end

    def debug(message)
      @logger_class.logger.debug context(message)
    end

    def info(message)
      @logger_class.logger.info context(message)
    end

    def warn(message)
      @logger_class.logger.warn context(message)
    end

    def error(message)
      @logger_class.logger.error context(message)
    end

    def fatal(message)
      @logger_class.logger.fatal context(message)
    end

    private

    def context(message)
      { class: @class_name, message: message }
    end

    def logger_class
      (Raes.config.dig(:concern, :context_logger) || 'Rails').constantize
    end
  end
end
