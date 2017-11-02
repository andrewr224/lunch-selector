class Menu
  class Edit < ApplicationService
    def initialize(params = {})
      @id = params[:id]
    end

    def call
      menu
    end

    private

    attr_reader :id

    def menu
      @menu ||= Menu.find_by(id: id)
    end
  end
end
