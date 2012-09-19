class ExperimentsController < ApplicationController
  before_filter :signed_in_user,  only: [:create, :destroy]
  before_filter :correct_user,    only: :destroy

  def create
    @experiment = current_user.experiments.build(params[:experiment])
    if @experiment.save
      flash[:success] = "experiment created!"
      redirect_to root_url
    else
      @experiments = current_user.experiments.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @experiment.destroy
    redirect_to root_url
  end

  private
    def correct_user
      @experiment = current_user.experiments.find_by_id(params[:id])
      redirect_to root_url if @experiment.nil?
    end
end
