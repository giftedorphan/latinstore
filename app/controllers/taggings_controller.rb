class TaggingsController < BaseController
  before_action :set_tagging, only: :destroy

  respond_to :html, :json

  def create
    @tagging = Tagging.new tagging_params

    if @tagging.valid? and @tagging.save
      flash[:success] = 'Tag was successfully linked.'
    else
      flash[:danger] = 'There was a problem with your request.'
    end

    respond_with @tagging, location: nil
  end

  def destroy
    if @tagging.destroy
      flash[:success] = 'Tag was successfully unlinked.'
    else
      flash[:danger] = 'There was a problem with your request.'
    end

    respond_with @tagging, location: nil
  end

  private
    def set_tagging
      @tagging = current_item.taggings.where(tag_id: params[:tagging][:tag_id]).first
    end

    def tagging_params
      params.fetch(:tagging, {}).permit(:tag_id, :taggable_id, :taggable_type)
    end
end