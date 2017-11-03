class Menu
  class Create < ApplicationService
    def initialize(params = {}); end

    def call
      menu if menu.save
    end

    private

    attr_reader :params

    def menu
      @menu ||= Menu.new
    end
  end
end
