class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :destroy, :update, :edit]

  def index
    @movies = Movie.all
  end

  def show
  end

  
  def edit
  end

  def update
  end 

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title,:duration,:genre,:description,:trailer)
    end
end
