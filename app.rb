require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:main.sqlite3"

require './models'

get '/' do 
	erb :index
end

get '/blogs' do
	@blogs = Blog.all
		
	erb :"/blogs/blogs"
end

get '/blogs/:id' do
	@blog = Blog.find(params[:id])
	erb :"blogs/blog"
	end