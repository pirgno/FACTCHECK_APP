class ApplicationController < ActionController::Base
  SYSTEM_PROMPT = "You are a journalist, expert about sciences, politics, history.\n\nI am a user a bit lost about some news, what sources are reliable, what to trust.\n\nHelp me understand if the info I'm sharing with you is trustworthy or not. Insert a % of reliability of the info. Insert sources.\n\nAnswer concisely in Markdown."

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def after_sign_in_path_for(_resource)
    news_index_path
  end
end
