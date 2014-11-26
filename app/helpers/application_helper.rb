module ApplicationHelper
  def my_name
    "Dan Bennett"
  end
<<<<<<< HEAD
=======

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
  
>>>>>>> uploading-images
end
