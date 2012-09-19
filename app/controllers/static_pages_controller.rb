class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @experiment   = current_user.experiments.build
      @experiments  = current_user.experiments.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
end
