class StaticPagesController < ApplicationController
  skip_before_filter :require_user
  def home
  end

  def about
  end
end
