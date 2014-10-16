# app.rb
# this is a simple Sinatra app that will test to make sure that your
# system is set up for the class correctly

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

require './models/TodoItem'

ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'db/development.db',
	encoding: 'utf8'
)

get '/' do
	@tasks = TodoItem.all
	erb :index
end

post '/' do
	TodoItem.create(params)
	redirect '/'
end
