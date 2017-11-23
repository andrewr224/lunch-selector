class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale, :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def notify(key, message)
    flash[key] = message
  end

  def allow_placement?(menu)
    policy(menu).allow_placement?
  end

  def allow_modification?(menu)
    policy(menu).allow_modification?
  end

  helper_method :allow_placement?, :allow_modification?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,        keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def policy(menu)
    MenuPolicy.new(menu)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def added_attrs
    %i[name email password password_confirmation remember_me]
  end
end
