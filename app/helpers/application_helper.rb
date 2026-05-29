module ApplicationHelper
  def render_markdown(text)
    html = Kramdown::Document.new(text, input: 'GFM', syntax_highlighter: "rouge").to_html
    sanitize(html)
  end

  def assistant_message_as_markdown(message)
    [
      ("# #{message.name}" if message.name.present?),
      assistant_meta_line(message),
      ("**Catégorie :** #{message.category}" if message.category.present?),
      message.content.presence
    ].compact.join("\n\n")
  end

  private

  def assistant_meta_line(message)
    meta = []
    meta << "**Verdict :** #{message.verdict}" if message.verdict.present?
    meta << "**Véracité :** #{message.truth_percentage}%" if message.truth_percentage.present?
    meta << "**Confiance :** #{message.confidence_level}" if message.confidence_level.present?
    meta.join(" — ").presence
  end

  # def assistant_tags_line(message)
  #   return nil unless message.tags&.any?

  #   message.tags.map { |tag| "`##{tag}`" }.join(" ")
  # end
end
