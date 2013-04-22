FfmpegRails::Application.routes.draw do

  match '/thumbnail' => 'videos#thumbnail', :as => :thumbnail
  root :to => 'videos#index'

end
