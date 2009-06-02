$:.unshift File.join(File.dirname(__FILE__),'models')
require 'rubygems'
require 'haml'
require 'appengine-apis/local_boot'
require 'sinatra'

include AppEngine
include AppEngine::Datastore::Query::Constants

get '/' do
  @title = "Continue the story"
  @content = "Frontpage"
  haml :index
end

get '/stories/?' do
  @title = 'Stories so far'
  @stories = AppEngine::Datastore::Query.new('Story')
  haml :stories
end

get '/story/add' do
  @title = 'Add new Story'
  haml :new
end

post '/story/add' do
  @story = Datastore::Entity.new('Story')
  @story['title'] = params[:title]
  @story['slug'] = params[:slug]
  @story['body'] = Datastore::Text.new( params[:body] )
  Datastore.put(@story)
  redirect '/stories'
end

get '/story/:slug' do
  @story = Datastore::Query.new('Story').filter('slug', EQUAL, params[:slug])
  haml :story
end

not_found do
  @title = "Content not found"
  @content = "Sorry, I can't find what you're looking for."
  haml :fourofour
end
