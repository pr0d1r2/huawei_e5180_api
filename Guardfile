guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end

guard :cane, run_on_start: true do
  watch(/^(.+)\.rb$/)
end

guard :rubocop, cli: ['--auto-correct'], run_on_start: true do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :rubycritic, run_on_start: true do
  watch(%r{^lib/(.+)\.rb$})
end

guard :rspec, all_on_start: true, cmd: 'bundle exec rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  watch('lib/huawei_e5180_api.rb') do
    'spec/huawei_e5180_api_spec.rb'
  end
end
