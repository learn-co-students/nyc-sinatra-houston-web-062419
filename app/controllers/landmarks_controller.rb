class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
      @landmarks = Landmark.all 
      erb :'landmarks/index'
  end

  get '/landmarks/new' do
      erb :'landmarks/new'
  end

  get '/landmarks/:id' do 
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
  end

  post '/landmarks' do
      landmark = Landmark.create(params[:landmark])
      redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      
      erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do 
      landmark = Landmark.find(params[:id])

      landmark.name = params[:name]
      landmark.year_completed = params[:year_completed]
      landmark.save
      # binding.pry

      redirect "/landmarks/#{landmark.id}"
  end

  delete '/landmarks/:id' do
      landmark = Landmark.find(params[:id])
      landmark.destroy
      redirect '/landmarks'
  end
end
