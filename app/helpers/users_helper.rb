module UsersHelper
  def user_has_posts?(posts)
    if posts.count == 0
      false
    else
      true
    end
  end

  def user_has_comments?(comments)
    if comments.count == 0
      false
    else
      true
    end
  end

end
