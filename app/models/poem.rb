class Poem < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  paginates_per 5
  
  def author
    user.name
  end
  
  def markdown_body
    markdown(body)
  end
  
  def self.search(search)
    if search
      where('title LIKE ? OR body LIKE ? OR author_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
  
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

end
