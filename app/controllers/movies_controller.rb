class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    
     @all_ratings = Movie.ratings

    #Set ratings to all ratings if not set
    session[:ratings] ||= @all_ratings
    
    #Default sorted by id
    session[:sorted] ||= 'id'
  
    #Highlight selected title or ratings header
    @title_hilite = session[:title_hilite] = "hilite" if params[:sorted] == 'title'
    @date_hilite = session[:date_hilite] = "hilite" if params[:sorted] == 'release_date'

    #Save settings
    session[:ratings] = params[:ratings].keys if params[:ratings]
    session[:sorted] = params[:sorted] if params[:sorted]

    #Preserving restful by passing hash to movies_path and saving with session
    redirect_to movies_path(ratings: Hash[session[:ratings].map {|r| [r,1]}], sorted: session[:sorted]) if  params[:ratings].nil? || params[:sorted].nil?

    #save rating and sort
    @ratings = session[:ratings]
    @sorted = session[:sorted]

    @movies = Movie.where(rating: @ratings).order(@sorted)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
