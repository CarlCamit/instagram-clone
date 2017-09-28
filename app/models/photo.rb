class Photo < ApplicationRecord
    include ImageUploader[:image]

    belongs_to :user
    has_and_belongs_to_many :likers, class_name: 'User', join_table: :likes

    geocoded_by :location
    after_validation :geocode, if: ->(obj){ obj.location_changed? and obj.location_changed? }   # auto-fetch coordinates

    # group_photo.liked_by?(js)
    def liked_by?(user)
        likers.exists?(user.id)
    end

    def toggle_liked_by(user)
        # If the photos has been liked by 'user'
        if likers.exists?(user.id)
            likers.destroy(user.id)
        # If the photo has not been iked by 'user'
        else
            likers << user
        end
    end
end

# photo = Photo.first
# all_people_liked_that_photo = photo.likers

# other_person = User.second
# # To make 'other_person' like 'photo':
# photo.likers << other_person # Click like button
# photo.likers.destroy (other_person) # Click unlike button
