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
    user = User.find_by(username:params['comment']['username'])
    content = params['comment']['content']
    story_id = params[:story_id]
    @comment = Comment.new(user_id:user.id, story_id:story_id, content:content)
    if @comment.save
      render json: @comment
    else
      render json: {errors: @comment.errors.full_messages}, status: 422
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: {errors: @comment.errors.full_messages}, status: 422
    end
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :story_id)
  end
end
