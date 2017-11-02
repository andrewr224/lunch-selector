class Menu
  class Destroy < ApplicationService
    def initialize(params = {})
      @id = params[:id]
    end

    def call
      menu.destroy
    end

    private

    attr_reader :id

    def menu
      @menu ||= Menu.find_by(id: id)
    end
  end
end
