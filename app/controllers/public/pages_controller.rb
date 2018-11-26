class Public::PagesController < ApplicationController
  def home
    @disable_navigation = true
  end

  def terms_of_use
    @disable_navigation = true
  end

end
