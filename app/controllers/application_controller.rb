class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def notify(key, message)
    flash[key] = message
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
