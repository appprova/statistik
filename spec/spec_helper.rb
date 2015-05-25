path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'rubygems'
require 'webmock/rspec'
require 'statistik'
require 'rspec'
require 'pp'

include Statistik

Statistik.config do |config|
  config.url     = 'http://statistics.appprova.com.br'
  config.version = 'v1'
end

FIXTURES_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
ROOT_URL = [Statistik.config.url.chomp('/'), Statistik.config.version].join '/'

WebMock.disable_net_connect!(allow_localhost: true)

def register(options)
  url = api_method_url(options[:url])
  method = options[:method] || :get

  stub_request(method, url)
      .with(headers: {
        'Accept'=>'*/*', 
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
        'User-Agent'=>'Ruby'
      })
      .to_return(body: read_fixture(options[:body] + '.json'), status: 200, headers: {})
end

def read_fixture(fixture)
  File.read(File.join(FIXTURES_PATH, fixture))
end

def api_method_url(method)
  ROOT_URL + '/' + method
end