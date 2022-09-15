# frozen_string_literal: true

class QrMenusController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
  end
end
