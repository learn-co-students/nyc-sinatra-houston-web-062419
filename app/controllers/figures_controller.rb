class FiguresController < ApplicationController
  # add controller methods
  # set :views '../views/figures'

  get '/figures' do
    @figures = Figure.all
    # binding.pry
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @figures = Figure.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    # figure = Figure.create(params[:figure])
    # if !params[:figure][:name].empty?
    #   new_figure = Figure.create(params[:figure])
    # end
    # new_figure.save
    figure = Figure.new(params[:figure])
        # binding.pry
        if !params[:author][:name].empty?
            # binding.pry
            new_author = Author.create(params[:author])
            book.author = new_author
        end
        # binding.pry
        book.save

    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    figure = Figure.find(params[:id])
    figure.name = params[:name]
    figure.save
    
    redirect "/figures/#{figure.id}"
  end

  delete '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.destroy
    redirect '/figures'
  end
end
