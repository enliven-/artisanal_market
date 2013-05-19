module ApplicationHelper
  
  def link_to_add_fields(name, f, association)
    if association == :palette
      new_object = Palette.new
    elsif association == :product_category
      new_object = ProductCategory.new
    else
      new_object = f.object.send(association).klass.new
    end
      
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def link_to_add_palette(name, f)
    
  end
  
end
