use Rack::MethodOverride

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

  post '/recipes/new' do
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    binding.pry
    redirect to "/recipes/show/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do #delete action
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    '/recipes/new'
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :show
  end

end
