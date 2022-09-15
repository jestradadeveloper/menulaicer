# frozen_string_literal: true

class QrCodesController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
  end
end
