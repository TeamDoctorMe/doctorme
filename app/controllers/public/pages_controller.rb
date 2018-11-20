class Public::PagesController < ApplicationController
  def home
    @disable_navigation = true
  end
end
