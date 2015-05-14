require 'spec_helper'

describe Statistik::Base do
  it "should allow extend classes to know which of its methods are provided by the Statistics API" do
    klass = Class.new(Statistik::Base) do
      setup_delegators *%w[foo bar baz]
    end

    expect(klass.api_methods).to eq(%w[foo bar baz])
  end
end