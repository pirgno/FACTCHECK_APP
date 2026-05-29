class Message < ApplicationRecord
  belongs_to :chat
  has_many :saved_messages, dependent: :destroy
  has_many :savers, through: :saved_messages, source: :user

  validates :verdict,
    inclusion: { in: News::VERDICTS + ["NON VÉRIFIABLE"] },
    allow_nil: true

  validates :truth_percentage,
    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
    allow_nil: true

  validates :confidence_level,
    inclusion: { in: News::CONFIDENCE_LEVELS },
    allow_nil: true

  validates :category,
    inclusion: { in: News::CATEGORIES },
    allow_nil: true

  validates :tags,
    length: { maximum: 5 },
    allow_nil: true

  def self.assistant_attributes_from(raw)
    cleaned = raw.to_s.strip.sub(/\A```(?:json)?\s*/i, "").sub(/```\s*\z/, "")
    parsed = JSON.parse(cleaned)

    {
      role: "assistant",
      content: normalize_content(parsed["content"]),
      verdict: parsed["verdict"],
      truth_percentage: parsed["truth_percentage"],
      confidence_level: parsed["confidence_level"],
      name: parsed["name"],
      category: parsed["category"],
      tags: Array(parsed["tags"]).first(5),
      origin: parsed["origin"]
    }
  rescue JSON::ParserError
    {
      role: "assistant",
      content: raw.to_s,
      verdict: "NON VÉRIFIABLE",
      truth_percentage: 0,
      confidence_level: "Faible",
      name: nil,
      category: nil,
      tags: [],
      origin: nil
    }
  end

  def self.normalize_content(value)
    return hash_to_markdown(value) if value.is_a?(Hash)

    str = value.to_s.strip
    if str.start_with?("{") && str.end_with?("}")
      sanitized = str.tr("“”‘’", %(""''))
      begin
        nested = JSON.parse(sanitized)
        return hash_to_markdown(nested) if nested.is_a?(Hash)
      rescue JSON::ParserError
        # fall through to return original string
      end
    end
    str
  end

  def self.hash_to_markdown(hash)
    hash.map { |key, value| "## #{key}\n\n#{value}" }.join("\n\n")
  end
end
