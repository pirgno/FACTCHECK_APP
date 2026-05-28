class Message < ApplicationRecord
  belongs_to :chat

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
end
