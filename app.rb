# app.rb
# this is a simple Sinatra app that will test to make sure that your
# system is set up for the class correctly

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

get '/' do
	file_contents = File.read('todo.txt')
	@lines = file_contents.split("\n")
	erb :index
end

post '/' do
	File.open('todo.txt', 'a+') do |file|
		file.puts "#{params[:task]} - #{params[:date]} "
	end
	redirect '/'
end
