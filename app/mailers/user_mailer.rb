class UserMailer < ApplicationMailer
  default from: 'notificaitons@note.com'

  def like_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Note Taking')
  end

  def unlike_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Note Taking')
  end
end
