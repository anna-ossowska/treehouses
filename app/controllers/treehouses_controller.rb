class TreehousesController < ApplicationController

  def show
   @treehouse = Treehouse.find(params[:id]) 
  end

end
