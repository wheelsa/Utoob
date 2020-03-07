class CommentsController < ApplicationController
  before_action :set_movie
  # before_action :set_user

  def index
    @comments = @movie.comments
  end

  def show
    comment = @movie.comments.find(params[:id])
  end 

  def edit
    # render partial: "comments/form"
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to [@movie, @comment]
      # same as redirect_to movie_comment_path(@movie, @comment)
    else
      render :edit
    end
  end

  def new
    # @users = User.all
    @comment = @movie.comments.new
  end

  def create
    @comment = @movie.comments.new(body: params[:comment][:body], user_id: current_user.id)
 
    if @comment.save
      
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end


  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end

 private
   def set_movie
     @movie = Movie.find(params[:movie_id]) 
   end

  #  def set_user
  #   @user = User.find(params[:user_id]) 
  # end
   def comment_params
    
     params.require(:comment).permit(:body, :user_id)
   end

end
