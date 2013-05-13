require 'redcarpet'

module Redcarpet::Variables
  class VariablesRenderer < ::Redcarpet::Render::HTML
    def initialize(options)
      @data_source = options.delete(:data_source)
      super options
    end

    def preprocess(full_document)
      # full_document is a ActiveSupport::SafeBuffer and must be
      # converted to string so that gsub works properly.
      # see: https://github.com/rails/rails/issues/1734
      full_document = "#{full_document}"

      full_document.gsub!(/\$\{([^}]*?)\}/) do
        @data_source.fetch $1
      end
      @data_source.clear
      full_document
    end
  end
end
