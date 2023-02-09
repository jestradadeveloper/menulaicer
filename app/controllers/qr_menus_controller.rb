# frozen_string_literal: true

class QrMenusController < ApplicationController
  layout 'qr_menus'
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
end
