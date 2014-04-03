Yks::Application.routes.draw do
 
 
  resources :news, :only => [ :index, :show ]
 
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
    
    post 'peditor/:id/createPhoto'					=> 'peditor#createPhoto'
    post 'peditor/:id/destroyPhoto'					=> 'peditor#destroyPhoto'
  end

  devise_for :admins, :controllers => { :sessions => 'admin/sessions' }
  
  resources :pages, :controller => :static_pages do 
  	collection do
  		get ':page', :action => :show, :as => :page
  	end
  end
  
  root :to => 'static_pages#index'
  
  get '(*url)'	 => 'errors#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
