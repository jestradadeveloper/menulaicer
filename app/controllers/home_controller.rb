# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @menus = Menu.all
    redirect_to dashboard_path if user_signed_in?
  end
end
