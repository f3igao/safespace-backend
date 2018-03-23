class CommentsController < ApplicationController
  def index
    @comments = Story.find(params[:story_id]).comments
    render json: @comments
  end

  def show
    comments = Story.find(params[:story_id]).comments
    @comment = comments.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: {errors: @comment.errors.full_messages}, status: 422
    end
  end

  def update
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :story_id)
  end
end
