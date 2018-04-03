class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb  :index
  end

  get '/recipes/new' do
    erb :new
  end

  post

end
