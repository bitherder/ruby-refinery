require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:spec) do |t|
  # t.libs.push 'lib'
  file_list = FileList['spec/**/*_spec.rb']
  puts "file_list: #{file_list.inspect}"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

task default: :spec
