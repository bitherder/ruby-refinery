require_relative '../../../../spec_helper.rb'
require 'refinery/core_ext/uri/module/build'

using Refinery

describe URI do
  it '#respond_to? shows the .parse method (sanity test)' do
    URI.respond_to?(:parse).must_equal true
  end

  it '#respond_to? shows the .build method' do
    skip "refinements currently don't support #respond_to? or #send"
    URI.respond_to?(:build).must_equal true
  end

  [
    # class        minumum .build arguments
    [URI::FTP,    {host: 'acme.com', path: '/something'}],
    [URI::HTTP,   {}],
    [URI::HTTPS,  {}],
    [URI::LDAP,   {}],
    [URI::LDAPS,  {}],
    [URI::MailTo, {to: 'boss@acme.com'}]
  ].each do |klass, args|
    base = klass.name.sub(/^.*::([^:]+)$/, '\1')
    [base, base.upcase, base.downcase, base.downcase.to_s].each do |scheme|
      it "generates an #{klass.name} if the scheme is #{scheme.inspect}" do
        args.merge!(scheme: scheme)
        result = URI.build(args)
        result.class.must_equal klass
        result.scheme.must_equal base.downcase
      end
    end
  end
end

