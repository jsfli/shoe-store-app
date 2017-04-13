require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")


#index page links and buttons
get("/") do
  erb(:index)
end

get('/add_brands') do
  erb(:add_brand)
end

get('/add_stores') do
  erb(:add_store)
end
