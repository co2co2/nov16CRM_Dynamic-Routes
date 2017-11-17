require_relative 'contact'
require 'sinatra'

get '/'do
redirect to('/crm')
end

get '/crm' do
  @contacts = Contact.all
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end


# get '/contacts/:id' do
#   # params[:id] contains the id from the URL
#   @contact = Contact.find_by({id: params[:id].to_i})
#   erb :show_contact
#
# end

get '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
