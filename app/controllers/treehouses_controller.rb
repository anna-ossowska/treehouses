class TreehousesController < ApplicationController

  def show
   @treehouse = Treehouse.find(params[:id]) 
  end


  def index
    @treehouses = Treehouse.all
  end
end
