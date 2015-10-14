class UserSignup < ApplicationMailer

  def signup(email)
    mail(
      to: email,
      from: "The Rock God <rock_on@albumexchange.org>",
      subject: "You signed up!",
      body: "Welcome to the new Album Exchange!"
    )
  end

end
