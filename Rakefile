# -*- encoding : utf-8 -*-
require "rubygems"
require "bundler"
Bundler.setup

Dir.glob('tasks/*.rake').each { |t| import t }

desc "Run the preview server at http://localhost:4567"
task :preview do
  system("bundle exec middleman server")
end

desc "Deploy to the live site via git"
task :deploy => [ :build ] do
  system("bundle exec middleman deploy")
end

task :default => [ :build ]
