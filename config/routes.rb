Yks::Application.routes.draw do
 
 
  resources :news, :only => [ :index, :show ]
  
  resources :babahomes, only: [:index, :show] do 
    collection do 
      post 'search', action: 'search'
    end
  end

  get 'fetch_from_country' => 'babahomes#fetch_from_country'
  get 'fetch_from_city' => 'babahomes#fetch_from_city'

  resources :ministorages, only: [:index, :show] do 
    collection do 
      post 'search', action: 'search'
    end
  end

  get 'fetch_from_country' => 'ministorages#fetch_from_country'
  get 'fetch_from_city' => 'ministorages#fetch_from_city'

  resources :intros, :controller => :intro_pages, :only => [ :show ] do 
    collection do
      get ':page', :action => :show, :as => :intro
    end
  end

  resources :services, :only => [ :index, :show ]
 
  resources :chapters, :only => [ :index, :show ] do
  	resources :knowledges, :only => [ :show ]
  end
 
  resources :tickets, :only => [ :index, :new, :create ]

  resources :prises, :only => [ :index, :show ]
  get 'prises/:year'		=> 'prises#index'
  
  
 # get 'instructions/:year'		=> 'instructions#index'

  resources :instructions, :only => [ :index, :show ]

  resources :notices, :only => [ :index, :show ] do
  	resources :recruits , :only => [ :index, :new, :create ]
  end
  

  namespace :admin do  
  
	authenticated :user do
	  root :to => "admins#index"
	end


  	get '/'		=> 'admins#index'

  	resources :admins
  
  	resources :photos do
  		member do
  			post :resize
  		end
  	end
  
    resources :news
    resources :instructions
    resources :prises do
    	resources :honorees, :only => [ :show, :edit, :update, :destroy ]
    end
    resources :notices do
    	resources :recruits, :only => [ :show ] 
    end
    
    resources :services do
    	member do
    		get 'external'
    		get 'regular'
    	end
    end
    
    resources :tickets
    
    resources :chapters do
    	resources :knowledges
    	
    	collection do
    		post 'sort'
    	end
    	
    end
    
    resources :babahomes do 
      member do 
        get   '/intro'       => 'babahomes#intro', as: 'intro'
        patch  '/update_intro'       => 'babahomes#update_intro'

        get 'fetch_from_country' => 'babahomes#fetch_from_country'
        get 'fetch_from_city' => 'babahomes#fetch_from_city'
      end
      collection do 
        get 'fetch_from_country' => 'babahomes#fetch_from_country'
        get 'fetch_from_city' => 'babahomes#fetch_from_city'
      end
    end

    resources :ministorages do
      member do 
        get   '/intro'       => 'ministorages#intro', as: 'intro'
        patch  '/update_intro'       => 'ministorages#update_intro'

        get 'fetch_from_country' => 'ministorages#fetch_from_country'
        get 'fetch_from_city' => 'ministorages#fetch_from_city'
      end
      collection do 
        get 'fetch_from_country' => 'ministorages#fetch_from_country'
        get 'fetch_from_city' => 'ministorages#fetch_from_city'
      end
    end

    resources :intro_pages

    post 'peditor/:id/createPhoto'					=> 'peditor#createPhoto'
    delete 'peditor/deletePhoto/:id'					=> 'peditor#destroyPhoto'
  end

  devise_for :admins, :controllers => { :sessions => 'admin/sessions' }
  
  resources :pages, :controller => :static_pages do 
  	collection do
  		get ':page', :action => :show, :as => :page
  	end
  end
  
  root :to => 'static_pages#index'
  
  get '(*url)'	 => 'errors#index'


end
