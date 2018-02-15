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
	session[:user_id] = 1
	@blogs = Blog.where(userid: session[:user_id])

	erb :'/Users/current'
end

get '/edit' do

	erb :'users/edit'
end

get '/signup' do

	erb :'users/signup'
end

post '/createBlog' do
Blog.create(title: params[:title], content: params[:content], userid: 1)
redirect "/current"
end

post '/deleteBlog/:id' do
	@blog = Blog.find(params[:id])
	@blog.destroy
redirect '/current'
end


















