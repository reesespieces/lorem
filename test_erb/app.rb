require 'sinatra'

get '/:name' do
  erb :my_view
end