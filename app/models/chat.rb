class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :news, optional: true
  has_many :messages
end
