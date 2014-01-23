class CommentsController < ApplicationController
  before_action :get_parent, only: [:new, :create]

  def new
    @comment = Comment.new
    case
    when @parent.is_a?(Post) then render :template => "comments/new_comment"
    when @parent.is_a?(Comment) then render :template => "comments/new_reply"
    else redirect_to root_path
    end
  end

  def create
    @comment = @parent.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post), :notice => "Thank you for your comment!"
    else
      render :new
    end
  end

  private

  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    redirect_to root_path unless defined?(@parent)
  end

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end