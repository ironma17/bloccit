class FavoriteMailer < ApplicationMailer
  default from: "erwin.nguyen@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@Bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@Bloccit.example>"
    headers["References"] = "<post/#{post.id}@Bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
      headers["Message-ID"] = "<post/#{post.id}@Bloccit.example>"
      headers["In-Reply-To"] = "<post/#{post.id}@Bloccit.example>"
      headers["References"] = "<post/#{post.id}@Bloccit.example>"

      @post = post

      mail(to: post.user.email, subject: "You're now following: #{post.title}")
  end

end
