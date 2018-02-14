require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:main.sqlite3"

require './models'

get '/' do 
	erb :index
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