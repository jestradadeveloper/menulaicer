# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = current_user.menus
  end
end
