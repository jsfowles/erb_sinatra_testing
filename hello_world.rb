require 'sinatra'
require 'pry'
require 'babbler'

# DSL - Domain Specific Language

# Root URL
get '/' do
  'Hello World!'
end

get '/hello' do
  'Hello dude'
end

# params is just a ruby hash
# Dynamic Route
get '/hello/:name' do
  "Hello, #{params[:name]}"
end

# URL Parameters
get '/hello/:name/:age' do
  age = params[:age].to_i + 10
  "#{params[:name]}'s age is now: #{age}"
end

#Query STring Parameters
get '/sport' do
  name = params[:name]
  if params[:favorite] == 'snowboarding'
    "You are awesome - #{name}!!"
  else
    "Do you even ride, #{name}?"
  end
end

#Query STring
# http://localhost:4567/sport?favorite=snowboarding&name=jake

get '/secret' do
  erb :secret
end

get '/zoo' do
  @animals = ['jake sorce', 'dave jungst', 'ty diamse',
             'will liang','bending nhi', 'jacob fowles']
@name = 'boof'
  erb :zoo
end

get '/numbers'do
    @numbers = [1,2,3,4,5,6,7,8,9,10]
    erb :numbers
end

post '/secret' do
  params[:message].reverse
end

not_found do
  status 404
  'not found'
end
