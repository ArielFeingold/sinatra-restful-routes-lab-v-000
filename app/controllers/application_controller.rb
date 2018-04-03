class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb  :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes/new' do
    binding.pry
    # Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time[:cook_time])
    redirect '/recipes'
  end

end
