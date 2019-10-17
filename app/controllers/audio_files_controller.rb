class AudioFilesController < ApplicationController
  skip_before_action :force_json, only: [:new]

  def index
    @audio_files = AudioFile.includes(:clips).all
  end

  def show
    @audio_file = AudioFile.find(params[:id])
  end

  def new
    @audio_file = AudioFile.new
  end

  def trim
    @audio_file = AudioFile.find(params[:id])
    api = NodeApiService.new(@audio_file.url)
    @audio_file = api.trim(start: params[:start], duration: params[:duration])
    render 'show'
  end

  def create
    @audio_file = AudioFile.new(post_params.merge(user_id: current_user.id))
    if !@audio_file.save
      err = @audio_file.errors.full_messages.join('. ')
      render json: {error: err}, status: :bad_request
      return
    end
    render 'show'
  end

  private

  def post_params
    params.require(:audio_file).permit(:name, :attached_file)
  end
end
