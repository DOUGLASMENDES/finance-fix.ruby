#require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  require File.join( '.', 'lib', 'finance-fix.rb' )
  Jeweler::Tasks.new do |gem|
    gem.name = "finance-fix"
    gem.version = Finance::FIX::VERSION
    gem.summary = %Q{Parse FIX protocol messages.}
    gem.description = %Q{Parse FIX protocol messages.}
    gem.email = "blair.christensen@gmail.com"
    gem.homepage = "http://github.com/blairc/finance-fix.ruby"
    gem.authors = ["Blair Christensen"]
    gem.add_development_dependency "shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError => e
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler: #{e}"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "finance-fix #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
