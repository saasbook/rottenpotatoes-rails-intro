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
   	if params.key?(:sort)
  		session[:sort] = params[:sort]
  		elsif session.key?(:sort)
  		params[:sort] = session[:sort]
  		flash.keep
  		redirect_to movies_path(params) and return
  	end
  	
  	if params.key?(:ratings)
  	  session[:ratings] = params[:ratings]
  	  elsif session.key?(:rating)
  	  params[:ratings] = session[:ratings]
  	  flash.keep
  	  redirect_to movies_path(params) and return
  	end
		
    @all_ratings = Movie.ratings

    @selected = (session[:ratings].keys if session.key?(:ratings))
    @selected ||= @all_ratings
    
    case params[:sort]
    when "title"
      @c1 = "hilite"
      @movies = Movie.order(title: :asc).where(rating: @selected)
    when "release_date"
      @c2 = "hilite"
      @movies = Movie.order(release_date: :asc).where(rating: @selected)
    else
      @movies = Movie.order(params[:sort_by]).where(rating: @selected)
    end
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
