require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:main.sqlite3"

require './models'

get '/' do 
	erb :index
end
