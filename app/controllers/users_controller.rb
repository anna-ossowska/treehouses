class UsersController < ApplicationController
  def show
    @user = current_user
    @booking = @user.bookings[0]
    t_id = Treehouse.find([@user.bookings[0].treehouse_id])
    @treehouse = t_id[0].name
  end
end
