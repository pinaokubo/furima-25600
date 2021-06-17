class Users::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(user_id: current_user.id)
  end

end