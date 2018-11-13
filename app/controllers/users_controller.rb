class UsersController < ApplicationController

  def edit
    @user.event_organiser = current_user(params[:event_organiser])
    if @user.event_organiser == true
    else @user.event_organiser == false
  end
end
