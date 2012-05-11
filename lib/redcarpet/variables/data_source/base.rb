module Redcarpet::Variables::DataSource
  class Base
    attr_accessor :options

    def initialize(options={})
      @options = options
    end

    def fetch(key)
      raise "The data source doesn't implement the fetch method"
    end

    def clear
    end
  end
end
