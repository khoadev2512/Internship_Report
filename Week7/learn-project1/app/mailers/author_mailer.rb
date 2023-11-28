# frozen_string_literal: true

class AuthorMailer < ApplicationMailer
  default from: 'khoa.gamerok@gmail.com'

  def welcome_email
    @author = params[:author]
    @url = 'google.com'
    mail(to: @author.email, subject: 'Welcome to My Awesome Site')
  end
end
