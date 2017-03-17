class ItemsController < BaseController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @items = Item.all.order("created_at DESC").paginate(
                                      :page => params[:page], :per_page => 9)
    respond_with @items
  end

  def show
    respond_with @item
  end

  def new
    @item = Item.new
    respond_with @item
  end

  def edit
    respond_with @item
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = 'Item was successfully created.'
    else
      flash[:danger] = 'There was a problem processing your request.'
    end

    respond_with @item
  end

  def update
    if @item.update_attributes item_params
      flash[:success] = 'Item was successfully updated.'
    else
      flash[:danger] = 'There was a problem processing your request.'
    end

    respond_with @item
  end

  def destroy
    if @item.destroy
      flash[:success] = 'Item was successfully deleted.'
    else
      flash[:danger] = 'There was a problem processing your request.'
    end

    respond_with @item
  end

  private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def item_params
      params.fetch(:item, {}).permit(:name, :price, :stock, :description)
    end
end