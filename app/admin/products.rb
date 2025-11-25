ActiveAdmin.register Product do
  filter :name
  filter :description
  filter :category
  filter :base_price
  filter :created_at
  filter :updated_at

  permit_params :name, :description, :base_price, :category_id, images: [], technology_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :base_price
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :base_price
      f.input :category
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :technologies, as: :check_boxes
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :base_price
      row :category

      row :images do |product|
        ul do
          product.images.each do |img|
            li do
              image_tag url_for(img), style: "width: 100px;"
            end
          end
        end
      end
    end
  end
end
