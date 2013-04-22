class VideosController < ApplicationController

  def thumbnail
    url = params[:url]
    video_url = url
    local_storage_path = '/tmp/1.png'
    system("ffmpegthumbnailer -i #{video_url} -o #{local_storage_path} -s 0 -t 10 -q 10")
    response.headers['Content-Type'] = 'image/png'
    response.headers['Content-Disposition'] = 'inline'
    render :text => File.open(local_storage_path).read
  end

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end
end
