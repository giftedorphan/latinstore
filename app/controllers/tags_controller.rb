class TagsController < BaseController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @tags = Tag.all
    respond_with @tags
  end

  def show
    respond_with @tag
  end

  def new
    @tag = Tag.new
    respond_with @tag
  end

  def edit
    respond_with @tag
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Tag was successfully created.'
    else
      flash[:error] = 'There was a problem processing your request.'
    end

    respond_with @tag
  end

  def update
    if @tag.update_attributes tag_params
      flash[:notice] = 'Tag was successfully updated.'
    else
      flash[:error] = 'There was a problem processing your request.'
    end

    respond_with @tag
  end

  def destroy
    if @tag.destroy
      flash[:notice] = "Tag was successfully deleted."
    else
      flash[:error] = 'There was a problem processing your request.'
    end

    respond_with @tag
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.fetch(:tag, {}).permit(:name)
    end
end