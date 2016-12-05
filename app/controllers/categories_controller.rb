class CategoriesController < BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @categories = Category.all
    respond_with @categories
  end

  def show
    respond_with @category
  end

  def new
    @category = Category.new
    respond_with @category
  end

  def edit
    respond_with @category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category was successfully created.'
    else
      flash[:error] = 'There was a problem processing your request.'
    end

    respond_with @category
  end

  def update
    if @category.update_attributes category_params
      flash[:notice] = 'Category was successfully updated.'
    else
      flash[:error] = "There was a problem processing your request"
    end

    respond_with @category
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Category was successfully deleted."
    else
      flash[:error] = 'There was a problem processing your request.'
    end

    respond_with @category
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.fetch(:category, {}).permit(:name)
    end
end