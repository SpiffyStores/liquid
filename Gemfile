# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) do |repo_name|
  "https://github.com/#{repo_name}.git"
end

gemspec

group :benchmark, :test do
  gem 'benchmark-ips'
  gem 'memory_profiler'
  gem 'terminal-table'

  install_if -> { RUBY_PLATFORM !~ /mingw|mswin|java/ && RUBY_ENGINE != 'truffleruby' } do
    gem 'stackprof'
  end
end

group :test do
  gem 'rubocop', '~> 1.4', require: false
  gem 'rubocop-shopify', '~> 1.0.7', require: false
  gem 'rubocop-performance', require: false

  platform :mri, :truffleruby do
    gem 'liquid-c', git: 'git@github.com:SpiffyStores/liquid-c.git', ref: 'master'
  end
end
