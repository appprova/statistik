require 'spec_helper'

describe 'Statistik.config' do
  it "should be accessed from class" do
    expect(Statistik.config).to respond_to :url
    expect(Statistik.config).to respond_to :version
  end

  it "should change Statistik URL" do
    Statistik.config.url = 'http://foo.bar'
    
    expect(Statistik.config.url).to eq('http://foo.bar')

    Statistik.configure do |config|
      config.url = 'http://bar.foo'
    end

    expect(Statistik.config.url).to eq('http://bar.foo')
  end

  it "should change Statistik API version" do
    Statistik.config.version = '2.0'

    expect(Statistik.config.version).to eq('2.0')

    Statistik.configure do |config|
      config.version = '3.0'
    end

    expect(Statistik.config.version).to eq('3.0')
  end

  it "should back to normal configuration" do
    Statistik.configure do |config|
      config.url     = 'http://statistics.appprova.com.br'
      config.version = 'v1'
    end

    expect(Statistik.config.url).to eq('http://statistics.appprova.com.br')
    expect(Statistik.config.version).to eq('v1')

  end
end