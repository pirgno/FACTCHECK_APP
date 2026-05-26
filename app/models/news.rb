class News < ApplicationRecord
  CATEGORIES = [
    "Histoire", "Science", "Santé", "Tech & IA", "Politique", "Culture pop", "Économie", "Environnement"
  ].freeze

  CONFIDENCE_LEVELS = ["Faible", "Moyenne", "Élevée"].freeze

  VERDICTS_PER_TRUTH_PERCENTAGE = {
    0...20 => "FAUX",
    20...40 => "PLUTÔT FAUX",
    40...70 => "PARTIELLEMENT VRAI",
    70...90 => "PLUTÔT VRAI",
    90..100 => "VRAI"
  }.freeze

  VERDICTS = VERDICTS_PER_TRUTH_PERCENTAGE.values.freeze

  has_many :chats

  validates :name, presence: true
  validates :content, presence: true
  validates :origin, presence: true

  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :confidence_level, presence: true, inclusion: { in: CONFIDENCE_LEVELS }
  validates :verdict, presence: true, inclusion: { in: VERDICTS + ["NON VÉRIFIABLE"] }
  validates :tags, presence: true, length: { maximum: 5 }
  validates :truth_percentage, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  }
end
