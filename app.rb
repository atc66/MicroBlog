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

post '/login' do
	@username = params[:username]
	@password = params[:password]
	 
	if 
	user = User.where(username: @username, password: @password).first
		session[:user_id] = user.id
		# user.username == params[:username]
		redirect "/current/#{user.id}"
	else
		redirect '/'
	end
 end


get '/current/:id' do
	 @user = User.find(session[:user_id])
  @blogs = Blog.where(userid: session[:user_id])
	erb :'/Users/current'
end


get '/blogs' do
	@blogs = Blog.all
	erb :"/blogs/blogs"
end

get '/blogs/:id' do
	@blog = Blog.find(params[:id])
	if session[:user_id]
		@user = User.find(session[:user_id])
	else
		@user = nil
	end
	erb :"blogs/blog"
end

get '/edit' do

	erb :'Users/edit'
end

get '/signup' do

	erb :'Users/signup'
end

post '/createBlog' do
	@user = User.find(session[:user_id])
Blog.create(title: params[:title], content: params[:content], userid: session[:user_id])
redirect "/current/#{@user.id}"
end

post '/deleteBlog/:id' do
	@user = User.find(session[:user_id])
	@blog = Blog.find(params[:id])
	@blog.destroy
	redirect "/current/#{@user.id}"
end

get '/update_Blog/:id' do
	@user = User.find(session[:user_id])
	@blog = Blog.find(params[:id])
	redirect "/blogs/update/#{@blog.id}"
end

get '/blogs/update/:id' do
	@blog = Blog.find(params[:id])
erb :"blogs/updateBlog"
end
