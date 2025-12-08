class InquiryMailer < ApplicationMailer
  def send_inquiry(email, message)
    @message = message
    @from_email = email

    mail(
      to: "sample@example.com",
      from: email,
      subject: "【サイト】お問い合わせが届きました"
    )
  end
end
