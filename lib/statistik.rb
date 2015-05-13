path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require "json"
require "httparty"

require "statistik/version"
require "statistik/mock"
require "statistik/mock_user"
require "statistik/mock_question"
require "statistik/mock_alternative"


module Statistik
  include HTTParty
  
  class Client
    URL = 'http://private-87257-appprovastatistics.apiary-mock.com/'
    API_VERSION = '1.0'
    
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
      @url = normalize(options.url || URL)
      @api_version = options.api_version || API_VERSION
    end

    def root_path
      normalize(url + api_version)
    end

    def api_method_url(path, options = {})
      root_path + normalize(path) + query_string(options)
    end

    def get(url)
      JSON.parse(open(url))
    end

    def request(path, options)
      get api_method_url(path, options)
    end

    private
      def query_string(options)
        params = options[:query] || options[:conditions]
        return '' unless params

        params = params.sort_by{ |k,v| k.to_s }
        pairs = params.map{ |k,v| "#{k}=#{v}" }

        '?' + pairsx.join('&')
      end

      def normalize(url)
        url.end_with?('/') ? url : url + '/'
      end

  end
end
