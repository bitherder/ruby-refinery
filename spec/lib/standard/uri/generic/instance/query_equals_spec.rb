require_relative '../../../../../spec_helper.rb'
require 'refinery/standard/uri/generic/instance/query_equals'

using Refinery

describe URI::Generic do

  describe '#query=' do
    it 'accepts an array' do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com')
      uri.query = [['x', '3'], ['abc', '1']]
      uri.query.must_equal "x=3&abc=1"
    end

    it 'accepts a hash' do
      uri = URI::Generic.build(scheme: 'http', host: 'acme.com')
      uri.query = {'x' => '3', 'abc' => '1'}
      uri.query.must_equal "x=3&abc=1"
    end
  end

end
