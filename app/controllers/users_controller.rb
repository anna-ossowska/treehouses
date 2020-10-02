class UsersController < ApplicationController
  # implemented some logic here to check if the current user has any bookings
  # or treehouses assigned yet. This is for showing in the user profile
  def show
    @user = current_user

    if @user.bookings[0].nil?
      return
    else
      @bookings = @user.bookings
    end

    if @user.treehouses[0].nil?
      return
    else
      @treehouses = @user.treehouses
    end
  end
end
