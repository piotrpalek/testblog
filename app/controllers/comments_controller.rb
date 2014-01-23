class CommentsController < ApplicationController
  before_filter :authenticate_user!
  expose(:post)
  expose(:comments) { post.comments }
  expose(:comment)

  def index
  end

  def new
  end

  def create
    if comment.save
      redirect_to comment.post, :notice => "Successfully created comment."
    else
      render :new
    end
  end

end
