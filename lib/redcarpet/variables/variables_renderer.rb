require 'redcarpet'

module Redcarpet::Variables
  class VariablesRenderer < ::Redcarpet::Render::HTML
    def initialize(options)
      @data_source = options.delete(:data_source)
      super options
    end

    def preprocess(full_document)
      full_document.gsub!(/\$\{(.*?)\}/) do
        @data_source.fetch $1
      end
      @data_source.clear
      full_document
    end
  end
end
