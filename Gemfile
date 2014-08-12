source 'https://rubygems.org'

# Specify your gem's dependencies in CorePro.gemspec
gemspec

# gem 'CorePro'

group :test do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem "win32console", '1.3.0'
  end
  gem "minitest"
  gem 'minitest-reporters', '>= 0.5.0'
  gem 'test-unit'
end