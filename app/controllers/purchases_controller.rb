class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_id
  before_action :unless_product
  def index
    @purchase_address = PurchaseAddress.new
  end
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_product
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end
  def set_product_id
    @product = Product.find(params[:product_id])
  end
  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
  def unless_product
    redirect_to root_path if @product.user_id == current_user.id || @product.purchase.present?
  end
end