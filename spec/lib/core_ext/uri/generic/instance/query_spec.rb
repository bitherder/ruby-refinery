require_relative '../../../../../spec_helper.rb'
require 'refinery/core_ext/uri/generic/instance/query'

using Refinery

describe URI::Generic do

  describe '#query' do
    it 'is a string' do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query
      result.must_be_kind_of String
    end

    it 'result has a to_a method' do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query
      result.must_respond_to :to_a
    end

    it "result's to_a returns an array" do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query.to_a
      result.must_be_kind_of Array
    end

    it "result's to_a retruns [['a', '3'], ['abc', '1']]" do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query.to_a
      result.must_equal [['x', '3'], ['abc', '1']]
    end

    it 'result has a to_h method' do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query
      result.must_respond_to :to_h
    end

    it "result's to_h returns an array" do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query.to_h
      result.must_be_kind_of Hash
    end

    it "result's to_h retruns {'a' => '3', 'abc' => '1'}" do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com', query: 'x=3&abc=1')
      result = uri.query.to_h
      result.must_equal('x' => '3', 'abc' => '1')
    end
  end

end
