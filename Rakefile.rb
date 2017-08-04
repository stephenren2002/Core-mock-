require 'bundler'
require 'cucumber/rake/task'
ENV['ruby_env'] ||= 'local'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = %w{--format pretty}
end

desc "Bootstrap to setup the project"
task :bootstrap do
  puts "Running bootstrap task"
  sh "bundle update"
  if ENV['ruby_env'] == 'local'
    if !File.exist?('cm/local.rb')
      puts 'creating local env file from example'
      cp 'cm/local.rb.example', 'cm/local.rb'
    end
  end
end

desc "Run features for CM. pass in ruby_env={env} to specify env."
task :cm_features => :bootstrap do
  puts "Run tests for: #{ENV['ruby_env']}"
  cd "cm"
  Rake::Task[:features].execute
end

