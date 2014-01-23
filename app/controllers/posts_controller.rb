class PostsController < ApplicationController
  def index
    @tags = Tag.all
    if params[:tag]
      @posts = fetch_posts(params[:tag])
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.tags = tags
    if @post.save
      redirect_to posts_path, :notice => "Your post was created successfully"
    else
      render :action => :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :body)
  end

  def tags
    params[:post][:tags].split(", ").map { |tag| Tag.new(name: tag) }
  end

  def fetch_posts(tag_id)
    Post.joins(:tags).where( tags: {name: Tag.find_by_id(tag_id).name} )
  end
end
