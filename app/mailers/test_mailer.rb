class TestMailer < ApplicationMailer

  default from: 'hanauta.comm@gmail.com' #example.comに自分のドメインを追加

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.test.subject
  #
  def test
    @greeting = "Hi"

    mail to: "hanauta.comm@gmail.com" #追加
  end
end
