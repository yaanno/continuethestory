$:.unshift File.join(File.dirname(__FILE__),'models')
require 'rubygems'
require 'haml'
require 'models'
require 'sinatra'
 
get '/' do
  @title = "Continue the story"
  @content = "Hello from Sinatra on Appengine - using Appengine, JRuby, Sinatra framework, Haml, Appengine Apis."
  haml :index
end

get '/stories/?' do
  puts "try"
  @stories = Story.all
  puts @stories
  haml :stories
end

get '/story/add' do
  haml :new
end

post '/story/add' do
  @story = Story.create(params[:story])
  redirect '/stories'
end

get '/story/:id/?' do
  @title = "The story"
  @story = "Let the story begins..."
  haml :story
end

not_found do
  @title = "Content not found"
  @content = "Sorry, I can't find what you're looking for."
  haml :fourofour
end