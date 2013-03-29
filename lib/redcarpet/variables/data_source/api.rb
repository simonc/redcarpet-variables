module Redcarpet::Variables::DataSource
  class Api < Base
    def initialize(options={})
      @http_fetcher = options.delete(:http_fetcher) || HTTParty
      clear
      super
    end

    def default_value
      options[:default_value] || ''
    end

    def fetch(key)
      @cache[key] ||= fetch_value(url_for key)
    end

    def fetch_value(url)
      response = @http_fetcher.get(url)
      response.code == 200 ? response.parsed_response[value_key] : default_value
    end

    def clear
      @cache = {}
    end

    def url_for(key)
      raise "The URL option is not set in options[:url]" unless options[:url]
      raise "Variable key is empty" if key.nil? || key.empty?

      options[:url] % { key: key }
    end

    def value_key
      options[:value_key] || 'value'
    end
  end
end
