class TreehousesController < ApplicationController
  def show
    @treehouse = Treehouse.find(params[:id])
  end

  def index
    @treehouses = Treehouse.search(params)
  end
end
