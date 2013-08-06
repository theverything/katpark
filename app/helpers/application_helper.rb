require 'redcarpet'
module ApplicationHelper
  def markdown(text)
    markdown_options = { autolink: true, space_after_headers: true }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, markdown_options)
    markdown.render(text)
  end

  def gravatar(email, size)
    hash = Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash}?s=#{size.to_s}"
  end
end
