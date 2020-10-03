class Article < ApplicationRecord
    validates_presence_of :title, :content
    validates :slug, presence: true, uniqueness: true

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }
end
