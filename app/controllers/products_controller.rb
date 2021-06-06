class ProductsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.order("create_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :info, :price, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                    :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
