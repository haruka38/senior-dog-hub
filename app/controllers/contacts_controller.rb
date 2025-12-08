class ContactsController < ApplicationController
  def new
  end

  def create
    InquiryMailer.send_inquiry(params[:email], params[:message]).deliver_now
    redirect_to new_contact_path, notice: "お問い合わせを送信しました。"
  end
end
