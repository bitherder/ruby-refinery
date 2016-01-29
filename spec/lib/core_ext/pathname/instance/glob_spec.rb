require_relative '../../../../spec_helper.rb'
require 'refinery/core_ext/pathname/instance/glob'
require 'tmpdir'

using Refinery

# TODO: deal with glob options
describe Pathname do
  before(:each) do
    @tmp_path = Pathname(Dir.mktmpdir('refinery'))
    FileUtils.touch @tmp_path+'aa'
    FileUtils.touch @tmp_path+'ab'
    FileUtils.touch @tmp_path+'ba'
    FileUtils.touch @tmp_path+'bb'
  end

  after(:each) do
    FileUtils.remove_entry @tmp_path
  end

  describe '#glob' do
    it 'takes an argument' do
      Pathname.new('some/path').glob('a')
    end

    it 'returns an empty list if there is nothing' do
      result = @tmp_path.glob('x')
      result.must_be_kind_of Array
      result.must_be_empty
    end

    it 'selects by prefix' do
      result = @tmp_path.glob('a*')
      result.length.must_equal 2
      names = Set[*result.map{|p| p.basename.to_s}]
      names.must_equal Set['aa', 'ab']
    end

  end
end
