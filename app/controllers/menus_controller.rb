class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @facade = Menu::ShowFacade.new(params)
  end

  def new
    @menu = Menu.new
  end

  def create
    menu = Menu::Create.call(params)
    if menu
      redirect_to menu, notice: 'Menu created!'
    else
      flash.now[:error] = 'Something went wrong :('
      render :new
    end
  end

  def edit
    @menu = Menu::Edit.call(params)
  end

  def update
    menu = Menu::Update.call(params)
    if menu
      redirect_to menu, notice: 'Menu updated!'
    else
      flash.now[:error] = 'Something went wrong :('
      render :edit
    end
  end

  def destroy
    Menu::Destroy.call(params)
    redirect_to menus_path, notice: 'Menu destroyed!'
  end
end
