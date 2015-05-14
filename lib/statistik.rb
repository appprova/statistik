path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require "json"
require "httparty"
require "active_support/inflector"
require 'active_support/configurable'
require "string"

require "statistik/version"
require "statistik/base"
require "statistik/mock"
require "statistik/mock_alternative"
require "statistik/mock_comparison"
require "statistik/mock_question"
require "statistik/mock_school"
require "statistik/mock_user"


module Statistik
  include HTTParty
  include ActiveSupport::Configurable

  config_accessor :end_point

  self.config.url     ||= "https://statistics.appprova.com.br"
  self.config.version ||= "1.0"
  
  class Client
    attr_reader :url
    attr_reader :api_version

    class << self

      def config(&block)
        options = OpenStruct.new
        yield options if block_given?
        @client = Client.new(options)
      end

      def instance
        @client
      end

    end

    def initialize(options = OpenStruct.new)
      @url = normalize(options.url || Statistik.config.url)
      @api_version = options.api_version || Statistik.config.version
    end

    def root_path
      normalize(url + api_version)
    end

    def api_method_path(pattern, params, options = {})
      pattern.scan(/:(\w+)/).each do |part|
        val = part.first
        pattern.sub!(":" + val, params[val.to_sym].to_s)
      end

      pattern
    end

    def api_method_url(method, params, options = {})
      root_path + api_method_path(method, params, options) + query_string(options)
    end

    def get(url)
      response = HTTParty.get url
      JSON.parse response.body
    end

    def request(path, params, options)
      get api_method_url(path, params, options)
    end

    private
      def query_string(options)
        params = options[:query] || options[:conditions]
        return '' unless params

        params = params.sort_by{ |k,v| k.to_s }
        pairs = params.map{ |k,v| "#{k}=#{v}" }

        '?' + pairs.join('&')
      end

      def normalize(url)
        url.end_with?('/') ? url : url + '/'
      end

  end
end
