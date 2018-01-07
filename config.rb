# -*- encoding : utf-8 -*-

###
# Plugins
###

activate :automatic_image_sizes

activate :directory_indexes
page '/404.html', :directory_index => false

###
# Middleman Settings
###

$middleman_application = self
require 'extensions/kramdown_sitemap'
set :markdown_engine, :kramdown
set :markdown, :smartypants => true

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Foundation puts their JS in a weird spot; fix
sprockets.append_path File.join(Gem::Specification.find_by_name('zurb-foundation').full_gem_path, 'js')

###
# Build Configuration
###

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  
  activate :favicon_maker
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = "https://github.com/grantramsey/grantramsey.github.io.git"
  deploy.branch = "master"
end