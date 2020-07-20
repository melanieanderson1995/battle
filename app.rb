require "sinatra"

get '/' do
  "hello!"
end

get "/secret" do
  "Psst!"
end

get "/fruit" do
  "banana"
end
