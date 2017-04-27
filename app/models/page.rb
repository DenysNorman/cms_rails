class Page < ApplicationRecord
 has_many :blocks, class_name: 'Content'
 accepts_nested_attributes_for :blocks, allow_destroy: true
end
