# frozen_string_literal: true

require 'rainbow'

def project_name
  'BTT'
end

## Serve
task :serve do
  puts Rainbow("== Project: #{project_name}").bright.green
  puts Rainbow('== Serve').bright.green
  system 'bundle exec middleman serve' || exit(1)
end

## Build the website
task :build do
  puts Rainbow("== Project: #{project_name}")
  puts Rainbow('== Build')
  system 'bundle exec middleman build --verbose' || exit(1)
end
