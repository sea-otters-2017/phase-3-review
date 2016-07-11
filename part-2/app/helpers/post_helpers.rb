module PostHelpers
  def post_heading(post)
    "#{post.guest_name} #{communication_method} ..."
  end

  def post_tagline(post)
  "Written by #{post.guest_name} from #{post.hometown} on #{post.created_at.strftime("%B %d, %Y")}."
  end

  def post_likes_count(post)
    if post.likes_count == 1
      "#{post.likes_count} like"
    else
      "#{post.likes_count} likes"
    end
  end

  private
  def communication_method
    %w[wrote said shared].sample
  end
end

helpers PostHelpers
