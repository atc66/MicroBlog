require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:main.sqlite3"
set :sessions, true

require './models'

get '/' do 
	@blogs = Blog.all
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
get '/users' do

	erb :users
end

post '/' do
user = User.where(username: params[:username]).first

if user.username == params[:username]
	session[:user_id]=user.id
	redirect '/profile'
else
	redirect '/'
	end
end