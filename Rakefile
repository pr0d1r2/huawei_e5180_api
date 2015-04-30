# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification...
  # see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = 'huawei_e5180_api'
  gem.homepage = 'http://github.com/pr0d1r2/huawei_e5180_api'
  gem.license = 'MIT'
  gem.summary = %(Api support for Huawei E5180 LTE modem in ruby.)
  gem.description = %(Api support for Huawei E5180 LTE modem in ruby.)
  gem.email = 'pr0d1r2@gmail.com'
  gem.authors = ['Marcin Nowicki']
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc 'Code coverage detail'
task :simplecov do
  ENV['COVERAGE'] = 'true'
  Rake::Task['spec'].execute
end

task default: :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "huawei_e5180_monitoring #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
