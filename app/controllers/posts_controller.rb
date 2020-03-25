class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :post_info_correct_user, {only: [:show]}

  def index
    @posts = Post.where(post_info: 1).order(created_at: :desc) 
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title], 
      fact: params[:fact], 
      abstraction: params[:abstraction], 
      diversion: params[:diversion],
      post_info: params[:post_info],
      user_id: @current_user.id)
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
    @post.post_info = params[:post_info]
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

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def post_info_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id && @post.post_info != 1
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
