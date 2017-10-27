class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])

    @order = Order.new
    @order.menu_id = @menu.id

    @meal = Meal.new
    @meal.menu_id = @menu.id
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new
    @menu.save
    flash.notice = 'Menu created!'
    redirect_to menu_path(@menu)
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    # no need to change the actual menu
    flash.notice = 'Menu updated!'
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash.notice = 'Menu destroyed!'
    redirect_to menus_path
  end
end
