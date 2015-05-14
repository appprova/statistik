path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'rubygems'
require 'fakeweb'
require 'statistik'
require 'rspec'
require 'pp'

include Statistik
Statistik::Client.config 

FIXTURES_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
ROOT_URL = [Statistik::Client::URL.chomp('/'), Statistik::Client::API_VERSION].join '/'
FakeWeb.allow_net_connect = false

def register(options)
  url = api_method_url(options[:url])
  FakeWeb.register_uri(:get, url, body: read_fixture(options[:body] + '.json'))
end

def read_fixture(fixture)
  File.read(File.join(FIXTURES_PATH, fixture))
end

def api_method_url(method)
  ROOT_URL + method
end

register(url: 'mocks/111', body: 'mocks_by_id')
register(url: 'mocks/111?school_id=222', body: 'mocks_by_id_with_comparison')
register(url: 'mocks/111/users/333', body: 'users_by_id')
register(url: 'mocks/111/questions/444', body: 'questions_by_id')
register(url: 'mocks/111/questions/444?school_id=222', body: 'questions_by_id_with_comparison')
register(url: 'mocks/111/alternatives/555', body: 'alternatives_by_id')
register(url: 'mocks/111/alternatives/555?school_id=222', body: 'alternatives_by_id_with_comparison')