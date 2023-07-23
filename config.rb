# frozen_string_literal: true

# General config
# http://localhost:4567/__middleman

# Set root_locale
root_locale = :en

# Accessible as `root_locale` in helpers and `config[:root_locale]` in templates
set :root_locale, root_locale

# Activate i18n for root locale
activate :i18n, mount_at_root: root_locale, langs: %i[en]

# Load Sass from node_modules
config[:sass_assets_paths] << File.join(root, 'node_modules')

# Set assets directories
set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

# Handled by Webpack
ignore File.join(config[:js_dir], '*')
ignore File.join(config[:css_dir], '*')
ignore File.join(config[:fonts_dir], '*')

# Webpack
activate :external_pipeline,
         name: :webpack,
         command: build? ? 'yarn run build' : 'yarn run start',
         source: 'dist',
         latency: 1

activate :dotenv
activate :directory_indexes
activate :inline_svg

# Use kramdown for markdown
set :markdown_engine, :kramdown

# Layouts
# https://middlemanapp.com/basics/layouts

page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# Load and activate all components
# Dir['./components/**/*.rb'].each { |file| load file }
# Pathname.new('./components').children.each do |entry|
#   next unless entry.directory?

#   activate "#{entry.basename}_component".to_sym
# end

# Development-specific configuration
configure :development do
  set      :debug_assets, true
  activate :livereload
end

configure :build do
  set      :relative_links, true
  activate :asset_hash
  activate :gzip
  activate :minify_html, remove_input_attributes: false
end

ready do
  proxy '_headers', 'headers', ignore: true
end

