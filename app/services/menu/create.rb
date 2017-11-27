class Menu
  class Create < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      menu if menu.save
    end

    private

    attr_reader :user

    def menu
      @menu ||= user.menus.new
    end
  end
end
