class StoriesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @stories = Story.all
    render json: @stories
  end

  def show
    @story = Story.find(params[:id])
    render json: @story
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      render json: @story
    else
      render json: {errors: @story.errors.full_messages}, status: 422
    end
  end

  def update
  end

  def delete
  end

  private
  def story_params
    params.require(:story).permit(:content, :user_id, :location, :stories_tags_attributes => [:tag_attributes => [:name]])
  end

end
