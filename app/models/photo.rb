class Photo < ApplicationRecord
    include ImageUploader[:image]
    
    validates :description, presence: true
end
