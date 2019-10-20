module FormHelper

  def memo_kinds
    ['bookmark', 'attachment', 'idea', 'note', 'todo', 'image', 'event']
  end

  def form_colors
    {
      colors: {
        🔖: 'hsl(0, 80%, 80%)',
        📎: 'hsl(60, 80%, 80%)',
        🖼: 'rgb(188, 255, 155)',
        bookmark: 'hsl(0, 80%, 80%)',
        attachment: 'hsl(60, 80%, 80%)',
        idea: 'hsl(240, 80%, 80%)',
        note: 'hsl(180, 80%, 80%)',
        todo: '#FFAD05',
        image: 'rgb(188, 255, 155)',
        event: '#1AFFD5',
      }
    }
  end

  def form_collection_hightlighted(collection)
    collection.map do |object|
      [ object.to_s, object.id || 'new', class: ('form--select-hightlighted' if object.new_record?) ]
    end
  end

  def home_form_for(object, &block)
    class_name = object.class.name.underscore
    html = {
      class: 'form',
      'up-target': ".form--fields[#{class_name}]",
      'dropdown-content': true,
      'up-show-for': class_name,
      'failed': (true if object.errors.any?),
    }
    form_for object, html: html do |form|
      yield form
    end
  end

  def sorted_drawers(drawers)
    drawers.sort do |drawer_1, drawer_2|
      if drawer_1.new_record?
        -1
      elsif drawer_2.new_record?
        1
      else
        0
      end
    end
  end

  def sorted_galleries(galleries)
    # galleries.sort do |gallery_1, gallery_2|
    #   if gallery_1.new_record?
    #     -1
    #   elsif gallery_2.new_record?
    #     1
    #   else
    #     gallery_2.name || 0 <=> gallery_1.name || 0
    #   end
    # end
    galleries
  end

  def new_drawer_for(object)
    drawer = current_user.drawers.build
    if object.drawer.nil?
      object.drawer = drawer
    end
    drawer
  end

  def new_gallery_for(object)
    gallery = current_user.galleries.build
    if object.gallery.nil?
      object.gallery = gallery
    end
    gallery
  end

end
