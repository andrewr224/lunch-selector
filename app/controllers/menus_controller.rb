class MenusController < ApplicationController
  def index
    @menus = Menu.all.decorate
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
    redirect_to menu
  end

  def edit
    @facade = Menu::EditFacade.new(params)
  end

  def destroy
    Menu::Destroy.call(params[:id])

    notify(:notice, t('controllers.menus.flash.destroy'))
    redirect_to menus_path
  end
end
