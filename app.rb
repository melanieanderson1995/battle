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

get "/random-cat" do
  @name = ["Raul", "Winston", "Kilburn"].sample
  erb(:index)
end

get "/named-cat" do
  p params
  @name = params[:name]
  erb(:index)
end
