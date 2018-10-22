class AudioFilesController < ApplicationController
  skip_before_action :force_json, only: [:new]

  def index
    @audio_files = AudioFile.all
  end

  def show
    @audio_file = AudioFile.find(params[:id])
  end

  def new
    @audio_file = AudioFile.new
  end

  def create
    @audio_file = AudioFile.create(post_params)
    render 'show'
  end

  private

  def post_params
    params.require(:audio_file).permit(:name, :attached_file)
  end
end
