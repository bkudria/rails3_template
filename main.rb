run "rm -Rf README public/index.html public/javascripts/* test app/views/layouts/*"

gem 'haml', '>=3.0.4'
gem 'inherited_resources', '>=1.1.2'
gem 'will_paginate', '>=3.0.pre'
gem 'devise', '>=1.1.rc1'
gem 'simple_form'
gem "compass", ">= 0.10.1"

gem 'rspec', '>=2.0.0.beta.8', :group => :test
gem 'rspec-rails', '>=2.0.0.beta.8', :group => :test
gem "factory_girl", :git => "git://github.com/thoughtbot/factory_girl.git", :branch => 'rails3', :group => :test

gem 'cucumber', ">=0.6.3", :group => :cucumber
gem 'cucumber-rails', ">=0.3.0", :group => :cucumber
gem 'capybara', ">=0.3.6", :group => :cucumber
gem 'database_cleaner', ">=0.5.0", :group => :cucumber

gem 'rails3-generators', :git => "git://github.com/indirect/rails3-generators.git"

application  <<-GENERATORS 
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :rspec, :fixture => true, :views => false
  g.fixture_replacement :factory_girl, :dir => "spec/support/factories"
end
GENERATORS

run "bundle install"
generate "rspec:install"
generate "cucumber:skeleton --capybara --rspec --spork"
generate "simple_form_install"
run "haml --rails ."
run "gem install compass"
run "compass init --using blueprint --app rails"

get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
get "http://github.com/ricardoalmeida/rails3_template/raw/master/gitignore" ,".gitignore" 
get "http://github.com/ricardoalmeida/rails3_template/raw/master/screen.scss", "app/stylesheets/screen.scss"
get "http://github.com/ricardoalmeida/rails3_template/raw/master/application.html.haml", "app/views/layouts/application.html.haml"

git :init
git :add => '.'
git :commit => '-am "Initial commit"'
 
puts "SUCCESS!"
