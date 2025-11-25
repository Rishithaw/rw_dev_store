class ProductsController < ApplicationController
  def index
    @products = Product.includes(images_attachments: :blob).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
