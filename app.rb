require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")


#index page links and buttons
get("/") do
  erb(:index)
end

delete('/database_reset') do
  @brands=Brand.all()
  @stores=Store.all()
  @brands.each() do |brand|
  brand.destroy()
  end
  @stores.each() do |store|
    store.destroy()
  end
  redirect('/')
end

get('/add_brands') do
  @brands=Brand.all()
  erb(:add_brand)
end

get('/add_stores') do
  @stores=Store.all()
  erb(:add_store)
end

post('/add_stores') do
  name = params.fetch("name")
  Store.create({:name => name})
  redirect back
end

post('/add_brands') do
  name = params.fetch("name")
  Brand.create({:name => name})
  redirect back
end

delete('/stores/:id/delete') do
  store = Store.find(params.fetch("id"))
  store.destroy()
  redirect back
end

get("/stores/:id/edit") do
  @store = Store.find(params.fetch("id"))
  erb(:store_edit)
end

patch("/stores/:id/edit") do
  store = Store.find(params.fetch("id"))
  name = params.fetch("name")
  store.update({:name => name})
  redirect ('/add_stores')
end

get('/view_brands') do
  @brands = Brand.all()
  erb(:view_brands)
end

get('/view_stores') do
  @stores = Store.all()
  erb(:view_stores)
end

get('/stores/:id') do
  @store = Store.find(params.fetch("id"))
  @brands = Brand.all
  erb(:store)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch("id"))
  @stores = Store.all
  erb(:brand)
end

patch("/stores/:id/add_brand") do
  store = Store.find(params.fetch("id"))
  brand_id = params.fetch("brand_id")
  brand = Brand.find(brand_id)
  store.brands.push(brand)
  redirect back
end

patch("/brands/:id/add_store") do
  brand = Brand.find(params.fetch("id"))
  store_id = params.fetch("store_id")
  store = Store.find(store_id)
  brand.stores.push(store)
  redirect back
end
