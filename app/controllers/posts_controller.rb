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

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.fact = params[:fact]
    @post.abstraction = params[:abstraction]
    @post.diversion = params[:diversion]
    if @post.save
      flash[:notice] = "メモを編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "メモを削除しました"
    redirect_to("/posts/index")
  end
end
