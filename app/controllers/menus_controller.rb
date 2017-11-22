class MenusController < ApplicationController
  load_and_authorize_resource

  def index
    @menus = Menu.all.decorate
    @menus_policy = menus_creation_policy
  end

  def show
    @facade = Menu::ShowFacade.new(params)
  end

  def new
    @menu = Menu.new
  end

  def create
    menu = Menu::Create.call(current_user)

    notify(:notice, t('controllers.menus.flash.create')) if menu
    redirect_to edit_menu_path menu
  end

  def edit
    @facade = Menu::EditFacade.new(params)
  end

  def destroy
    Menu::Destroy.call(params[:id])

    notify(:notice, t('controllers.menus.flash.destroy'))
    redirect_to menus_path
  end

  def menus_creation_policy
    @menus_policy ||= MenusCreationPolicy.new
  end
end
