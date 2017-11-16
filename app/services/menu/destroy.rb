class Menu
  class Destroy < ApplicationService
    def initialize(id)
      @id = id
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
