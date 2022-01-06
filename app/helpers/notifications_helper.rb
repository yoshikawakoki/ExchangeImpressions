module NotificationsHelper
  
  def notification_form(notification)
    @visiter = notification.visiter
    @post_comment = nil
    your_post = link_to 'あなたの投稿', post_path(notification)
    @visiter_comment = notification.post_comment_id
    #notification.actionがfollowかfavoriteかpostcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:user_path(@visiter))+"があなたをフォローしました"
      when "favorite" then
        tag.a(notification.visiter.name, href:user_path(@visiter))+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id))+"にいいねしました"
      when "post_comment" then
          @post_comment = PostComment.find_by(id: @visiter_comment)&.content
          tag.a(@visiter.name, href:user_path(@visiter))+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id))+"にコメントしました"
    end
  end
  
  #未確認の通知を示すメソッド
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
  
end
