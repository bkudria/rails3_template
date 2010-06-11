run "rm -Rf README public/index.html public/javascripts/* test app/views/layouts/*"

gem 'haml', '>=3.0.4'
gem 'inherited_resources', '>=1.1.2'
gem 'devise', '>=1.1.rc1'
gem "compass", ">= 0.10.1"

gem 'rspec', '>=2.0.0.beta.8', :group => :test
gem 'rspec-rails', '>=2.0.0.beta.8', :group => :test
gem 'shoulda', :group => :test

gem 'rails3-generators', :git => "git://github.com/indirect/rails3-generators.git"

application  <<-GENERATORS 
config.generators do |g|
  g.template_engine :haml
  g.test_framework  :shoulda, :fixture => true, :views => false
end
GENERATORS

run "bundle install"
generate "rspec:install"
generate "simple_form:install"
run "gem install compass"
run "compass init --using blueprint --app rails"

get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
get "http://github.com/bkudria/rails3_template/raw/master/gitignore" ,".gitignore" 
get "http://github.com/bkudria/rails3_template/raw/master/screen.scss", "app/stylesheets/screen.scss"
get "http://github.com/bkudria/rails3_template/raw/master/application.html.haml", "app/views/layouts/application.html.haml"

puts "SUCCESS!"
