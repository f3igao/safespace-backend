class TagsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    @tag = Tag.find(params[:id])
    render json: @tag
  end
end
