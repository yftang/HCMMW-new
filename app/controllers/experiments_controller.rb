class ExperimentsController < ApplicationController
  before_filter :signed_in_user,  only: :destroy
  before_filter :correct_user,    only: :destroy

  def new
    @experiment = Experiment.new
  end

  def create
#   for signed in user
    if signed_in?
      @experiment = current_user.experiments.build(params[:experiment])
      if @experiment.save
        flash[:success] = "experiment created!"
        redirect_to root_url
      else
        @experiments = current_user.experiments.paginate(page: params[:page])
        render 'static_pages/home'
      end
#   for non-signed in user
    else
      @experiment = Experiment.new(params[:experiment])
      if @experiment.save
        flash[:success] = "experiment created!"
        redirect_to experiment_path(@experiment)
      else
        render 'experiments/new'
      end
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
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
