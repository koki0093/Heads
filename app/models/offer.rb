class Offer < ApplicationRecord
    belongs_to :user
    belongs_to :snkr
    has_many :notifications, dependent: :destroy
<<<<<<< HEAD
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images, allow_destroy: true

=======

    mount_uploader :image, ImageUploader

    def create_notification_by(current_user)
        notification = current_user.active_notifications.new(
          offer_id: id,
          
          visited_id: user_id,
          action: "update"
        )
        notification.save if notification.valid?
    end

>>>>>>> origin/master
    

    def create_notification_update!(current_user)
      temp = Notification.where(["visitor_id = ? and visited_id = ? and snkr_id = ? and offer_id = ? and action = ? ", current_user.id, user_id, snkr_id, id, 'update'])
      # updateされていない場合のみ、通知レコードを作成
      if temp.blank?
          notification = current_user.active_notifications.new(
            snkr_id: snkr_id,
            offer_id: id,
            visited_id: user_id,
             action: "update"
          )
        notification.save if notification.valid?
      end
    end



end
