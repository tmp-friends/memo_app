class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], fact: params[:fact], abstraction: params[:abstraction], diversion: params[:diversion])
    if @post.save
      flash[:notice] = "メモを作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
end
