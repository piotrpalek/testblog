class CommentsController < ApplicationController
  before_filter :authenticate_user!
  expose(:post)
  expose(:comments) { post.comments }
  expose(:comment, attributes: :comment_params)

  def index
  end

  def new
  end

  def create
    comment.user = current_user
    if comment.save
      redirect_to comment.post, :notice => "Successfully created comment."
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit!
  end

end
