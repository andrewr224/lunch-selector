class MenusController < ApplicationController
  before_action :build_menu!, only: %i[new create]
  before_action :find_menu!, only: %i[edit update destroy]

  def index
    @menus = Menu.all
  end

  def show
    menu   = Menu::Show.call(params)
    @menu  = menu[:menu].decorate
    @order = menu[:order]
    @meal  = menu[:meal]
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
    redirect_to menus_path, notice: 'Menu destroyed!'
  end

  private

  def build_menu!
    @menu = Menu.new
  end

  def find_menu!
    @menu = Menu.find(params[:id])
  end
end
