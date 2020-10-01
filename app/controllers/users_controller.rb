class UsersController < ApplicationController
  def show
    @user = current_user

    if @user.bookings[0].nil?
      return
    else
      @bookings = @user.bookings
    end
  end
end
