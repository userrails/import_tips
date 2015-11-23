Project::Application.routes.draw do
  get "exports/export"

  get "businesses/index"

 root :to=> "importscanadian#import"

#root :to => "imports#import"

resources :importscanadian do
	  collection do
		get :import
		post :ab_upload_xls
	end
end

  resources :businesses do
    collection do
      get :search
      get :autocomplete_businessmerged_name
       get :scraptiming
    end
  end

  resources :imports do
    collection do
      get :import
      post :upload_xls
      post :str_upload_xls
    post :str1_upload_xls
    post :strmerged_upload_xls
    
	 post :upload_csv
    end
  end
end