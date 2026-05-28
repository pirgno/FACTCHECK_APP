module ApplicationHelper
  def render_markdown(text)
    html = Kramdown::Document.new(text, input: 'GFM', syntax_highlighter: "rouge").to_html
    sanitize(html)
  end
end
