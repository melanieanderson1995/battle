require "sinatra"
#shotgun app.rb -p 4567

get '/' do
  "hello!"
end

get "/secret" do
  "Psst!"
end

get "/fruit" do
  "banana"
end

get "/cat" do
  erb(:index)
end
