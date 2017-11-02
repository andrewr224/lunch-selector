class Menu
  class Update < ApplicationService
    def initialize(params = {})
      @id = params[:id]
    end

    def call
      menu if menu.save
    end

    private

    attr_reader :id

    def menu
      @menu ||= Menu.find_by(id: id)
    end
  end
end
