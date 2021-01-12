class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: "Artykuł pomyślnie utworzono"
    else
      render :new, danger: "Artykuł nie został utworzony"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: "Artykuł pomyślnie zaktualizowano"
    else
      render :edit, danger: "Artykuł nie został zaktualizowany"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "Artykuł pomyślnie usunięto"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body)
  end
end
