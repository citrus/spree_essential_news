Rails.application.routes.draw do
  
  scope(:module => "News") do
    constraints(
      :year  => /\d{4}/,
      :month => /\d{1,2}/,
      :day   => /\d{1,2}/
    ) do 
      get '/news/:year(/:month)(/:day)' => 'articles#index', :as => :article_date
      get '/news/:year/:month/:day/:id' => 'articles#show',  :as => :full_article
    end
    
    get '/news/search/:query', :to => 'articles#search', :as => :search_articles, :query => /.*/
        
    resources :articles, :path => 'news' do
      get :archive, :on => :collection
    end
    
  end
  
  namespace :admin do
    
    scope(:module => "News") do
      resources :articles do 
        resources :images,   :controller => "article_images" do
          collection do
            post :update_positions
          end
        end
        resources :products, :controller => "article_products"
      end
    end
    
    resources :uploads
    
  end
  
end
