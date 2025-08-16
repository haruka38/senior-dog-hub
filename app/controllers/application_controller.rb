class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_guest_id

  private

  def set_guest_id
    if current_user.nil?
      # ||=で、すでに保存されていれば使う。なければ新しく作成して保存
      cookies.permanent[:guest_id] ||= SecureRandom.uuid
    end
  end
end
