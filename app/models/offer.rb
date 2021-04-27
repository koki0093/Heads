class Offer < ApplicationRecord
    belongs_to :user
    belongs_to :snkr
    has_many :notifications, dependent: :destroy

    mount_uploader :image, ImageUploader

    def create_notification_by(current_user)
        notification = current_user.active_notifications.new(
          offer_id: id,
          
          visited_id: user_id,
          action: "update"
        )
        notification.save if notification.valid?
    end

    



end
