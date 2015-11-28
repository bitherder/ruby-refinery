require 'bundler/setup'

require 'minitest/spec'
require 'minitest/autorun'
require 'pathname'

here = Pathname(__FILE__).dirname
project_base = (here+'..').expand_path
$: << project_base+'lib'

$PROJECT_BASE = project_base
