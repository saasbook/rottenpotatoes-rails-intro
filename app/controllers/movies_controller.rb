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
    option = params[:option]
    rating = params[:ratings]
    @result = Movie.select(:rating).distinct
    @all_ratings = @result.map{|i| i.rating}

    if session['rating_selected'] == nil
       session['rating_selected'] = @all_ratings
    end

    if option!=nil
      session['sorting_selected'] = option
    end

    if rating!=nil
     @selected = rating.keys
     session['rating_selected'] = @selected
    end

    if session['sorting_selected']=="title_header"
      @selected = session['rating_selected']
      @movies = Movie.where(rating:@selected).order :title
      @sort = 'title'
    elsif session['sorting_selected']=='release_date_header'
      @selected = session['rating_selected']
      @movies = Movie.where(rating:@selected).order :release_date
      @sort = 'date'
    elsif session['sorting_selected']==nil
      @selected = session['rating_selected']
      @movies = Movie.where rating:@selected
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    #debugger
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
