ActiveAdmin.register Language do
  
  index do
    column :name
    
    default_actions
  end
  
  form multipart: true do |f|
    f.inputs do
      f.input :name
      if f.object.logo.exists?
        f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo.url(:small))
      else
        f.input :logo, as: :file
      end
    end

    f.buttons
  end
  
  show do |lang|
    attributes_table do
      row :name
      row :logo do
        image_tag lang.logo.url(:small)
      end
    end
  end
  
end
