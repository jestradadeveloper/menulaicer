# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :authenticate_user!
  def new; end
  def create; end

  private

  def menu_params
    params.require(:menu).permit(:sheet_id)
  end
end
