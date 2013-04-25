# -*- encoding : utf-8 -*-

# Make the build task depend on all the files under the 'source' directory, all the local data, the extensions, the helpers, and the config.rb file and Gemfile.lock, which should be everything that actually influences the construction of the site
source_file_patterns = 
  'source/ '\
  'extensions/ '\
  'config.rb '\
  'Gemfile.lock'

source_files = `git ls-files #{source_file_patterns}`.split("\n")
source = FileList[source_files]


def do_build
  puts "## Building website"
  puts system("bundle exec middleman build") ? "OK" : "FAILED"
end


file "build/index.html" => source do
  do_build
end

# Synonym for ease of use
desc "Build the website from source"
task :build => "build/index.html"

# Force a build regardless of prerequisite status
desc "Force a build of the website from source"
task :force_build do
  do_build
end
