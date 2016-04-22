class PostsController < ApplicationController
	before_filter :authenticate_user!
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    if current_user.try(:admin?) 
      @post = Post.create(post_params)
      @post.user = current_user
      @post.like = 0
      if @post.save
        redirect_to @post
      else
        render 'new'
      end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end

  def destroy
   @post = Post.find(params[:id])
    if @post.destroy
     redirect_to root_path
    else
      :back
    end
  end

  def like_post
    @post = Post.find(params[:id])
    @post.like += 1
    #current_user.posts_liked << @post.id
    if @post.save
      redirect_to post_path(params[:id])
    end
  end

=begin
  def unlike_post
    @post = Post.find(params[:id])
    @post.like -= 1
    current_user.posts_liked.delete(@post.id)
    if @post.save
      redirect_to post_path(params[:id])
    end
  end
=end

  private

  def post_params
  	params.require(:post).permit(:title, :text, :sport)
  end

end
