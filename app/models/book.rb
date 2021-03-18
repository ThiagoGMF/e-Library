class Book < ApplicationRecord

    validates :title, presence: true
    validates :author, presence: true
    validates :year, presence: true
    validates :description, presence: true
    validates :cover, presence: true, blob: { content_type: :image }
    validates :content, presence: true, blob: { content_type: 'application/pdf' }

    has_one_attached :cover
    has_one_attached :content

    has_one :tag
    accepts_nested_attributes_for :tag

    def self.search(query)
        where("title like ? or author like ?", "%#{query}%", "%#{query}%")
    end

end
