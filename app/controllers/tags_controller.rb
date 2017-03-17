class TagsController < BaseController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @tags = Tag.all.order('created_at DESC').paginate(
                            :page => params[:page], :per_page => 9)
    respond_with @tags
  end

  def create
    @tag = Tag.where(:name => tag_params[:name].downcase).first_or_initialize

    if @tag.new_record?
      @tag.save
      flash[:success] = 'Tag was successfully created.'
    else
      flash[:danger] = 'Tag already exist.'
    end

    respond_with @tag, location: tags_path
  end

  def update
    if @tag.update_attributes tag_params
      flash[:success] = 'Tag was successfully updated.'
      respond_with(@tag, :location => tags_path, )
    else
      respond_to do |format|
        format.json { render json: @tag.errors, status: 422 }
      end
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = 'Tag was successfully deleted.'
    else
      flash[:danger] = 'There was a problem processing your request.'
    end

    respond_with @tag
  end

  private
    def set_tag
      @tag = Tag.find(params[:tag_id])
    end

    def tag_params
      params.fetch(:tag, {}).permit(:name)
    end
end