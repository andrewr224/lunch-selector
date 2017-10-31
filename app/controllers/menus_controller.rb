class MenusController < ApplicationController
  before_action :build_menu!, only: %i[new create]
  before_action :find_menu!, only: %i[show edit update destroy]

  def index
    @menus = Menu.all
  end

  def show
    @menu = MenuFacade.new(@menu)
  end

  def create
    @menu.save
    redirect_to menu_path(@menu), notice: 'Menu created!'
  end

  def update
    redirect_to menu_path(@menu), notice: 'Menu updated!'
  end

  def destroy
    @menu.destroy
    redirect_to menus_path, alert: 'Menu destroyed!'
  end

  private

  def build_menu!
    @menu = Menu.new
  end

  def find_menu!
    @menu = Menu.find(params[:id])
  end
end
