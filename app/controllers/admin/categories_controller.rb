class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: "Kategoria pomyślnie utworzona"
    else
      flash.now[:danger] = "Kategoria nie została utworzona"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, success: "Kategoria pomyślnie zaktualizowana"
    else
      flash.now[:danger] = "Kategoria nie została zaktualizowana"
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, success: "Kategorię pomyślnie usunięto"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end