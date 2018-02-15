require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:main.sqlite3"
set :sessions, true

require './models'

get '/' do 
	@blogs = Blog.all
	@blogs_reverse = @blogs.reverse
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

get '/current' do
	


	erb :'users/current'
end

get '/edit' do

	erb :'users/edit'
end

get '/signup' do

	erb :'users/signup'
end



















