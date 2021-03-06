class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: "Artykuł pomyślnie utworzono"
    else
      flash.now[:danger] = "Artykuł nie został utworzony"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: "Artykuł pomyślnie zaktualizowano"
    else
      flash.now[:danger] = "Artykuł nie został zaktualizowany"
      render :edit
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
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end
end
