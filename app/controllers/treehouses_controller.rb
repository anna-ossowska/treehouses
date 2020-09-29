class TreehousesController < ApplicationController

  def index
    @treehouses = Treehouse.all
  end
end
