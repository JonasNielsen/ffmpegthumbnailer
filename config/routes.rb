FfmpegRails::Application.routes.draw do

  match '/thumbnail' => 'videos#thumbnail'
  root :to => 'videos#index'

end
