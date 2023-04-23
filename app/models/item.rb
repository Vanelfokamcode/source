class Item < ApplicationRecord
    has_many :category_items

    has_many :categories, through: :category_items
    has_one_attached :image
end
