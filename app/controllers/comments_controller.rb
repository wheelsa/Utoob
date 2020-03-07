class CommentsController < ApplicationController
  before_action :set_movie

  def index
    @comments = @movie.comments
  end

  def show
    comment = @movie.comments.find(params[:id]
  end 

  def edit
    # render partial: "songs/form"
  end
  
  def update
    if @song.update(song_params)
      redirect_to [@artist, @song]
      # same as redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  def new
    @comments = @movie.comments.new
  end

  def create
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to movie_comments_path(@movie)
    else
      render :new
    end
  end

  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_comments_path(@movie)
  end

 private
   def set_movie
     @movie = Movie.find(params[:movie_id]) 
   end

   def comment_params
     params.require(:comment).permit(:role, :user_id)
   end
end
