# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :authenticate_user!
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create_with_sheet_key(user: current_user, sheet_key: menu_params[:sheet_key])
    if @menu.persisted?
      flash[:notice] = 'Menu Created'
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "menu-#{@menu.created_at.strftime('%Y-%m-%d')}",
               title: @menu.title,
               template: 'menus/showPDF', layout: 'pdf', page_size: 'Letter',
               header: { html: { template: 'menus/header', formats: [:html] } }, formats: [:html]
      end
    end
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.sync!
    flash[:notice] = 'Menu Synchronized correctly'
    redirect_to dashboard_path
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = 'Menu Deleted'
    redirect_to dashboard_path
  end

  private

  def menu_params
    params.require(:menu).permit(:sheet_key)
  end
end
