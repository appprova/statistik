require 'spec_helper'

describe 'Statistik.config' do
  it "should be accessed from class" do
    expect(Statistik.config.url).to eq('https://statistics.appprova.com.br')
  end

  it "should change Statistik URL" do
    Statistik.config.url = 'http://foo.bar'
    
    expect(Statistik.config.url).to eq('http://foo.bar')

    Statistik.configure do |config|
      config.url = 'http://bar.foo'
    end

    expect(Statistik.config.url).to eq('http://bar.foo')
  end
end