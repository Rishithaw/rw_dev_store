ActiveAdmin.register Product do
  permit_params :name, :description, :category_id, :image,
                product_prices_attributes: [:id, :price, :sale_price, :_destroy],
                product_technologies_attributes: [:id, :technology_id, :_destroy]

  form do |f|
    f.semantic_errors

    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :category
      f.input :image, as: :file
    end

    f.inputs "Pricing" do
      f.has_many :product_prices, allow_destroy: true do |pp|
        pp.input :price
        pp.input :sale_price
      end
    end

    f.inputs "Technologies" do
      f.has_many :product_technologies, allow_destroy: true do |pt|
        pt.input :technology
      end
    end

    f.actions
  end
end
