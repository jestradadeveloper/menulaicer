# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :authenticate_user!
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :sheet_key)
  end
end
