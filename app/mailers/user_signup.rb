class UserSignup < ApplicationMailer

  def signup(email, event)
    mail(
      to: email,
      from: "The Rock God <rock_on@albumexchange.org>",
      subject: "Album Exchange Event Notice",
    )
  end

end
