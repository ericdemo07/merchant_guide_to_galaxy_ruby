require 'rspec/core/rake_task'

task default: [:run]

task :run do
  ruby 'bin/initiator.rb'
end

task :test do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/specmain.rb'
  end
  Rake::Task["spec"].execute
end
