ActiveAdmin.register Product do
  permit_params :name, :description, :category_id, :image,
                product_prices_attributes: [:id, :price, :sale_price, :_destroy],
                product_technologies_attributes: [:id, :technology_id, :_destroy]

  form do |f|
      f.semantic_errors

      .inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :base_price
      f.input :category
      f.input :technologies, as: :check_boxes
    end

    f.inputs "Product Images" do
      f.input :images, as: :file, input_html: { multiple: true }
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

show do
  attributes_table do
    row :name
    row :description
    row :base_price
    row :category

    row :images do |product|
      if product.images.attached?
        product.images.map do |img|
          image_tag url_for(img), style: "max-height: 150px;"
        end.join.html_safe
      else
        "No images"
      end
    end
  end
end
