require 'redcarpet'
module ApplicationHelper
  def markdown(text)
    markdown_options = { autolink: true, space_after_headers: true }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, markdown_options)
    markdown.render(text)
  end
end
