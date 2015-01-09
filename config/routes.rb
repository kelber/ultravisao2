Rails.application.routes.draw do

  devise_for :vistoriadores

  devise_for :managers, 
         path: "auth", 
         path_names: { 
         sign_in: 'login',
         sign_out: 'logout', 
         password: 'secret', 
         confirmation: 'verification',
         unlock: 'unblock',
         registration: 'register',
         sign_up: 'cmon_let_me_in' }

 

   root 'welcome#index'

   get 'sobre-a-ultravisao', to: 'welcome#sobre', as: :sobre
   # get 'welcome/index'   
   get 'ultravisao-no-brasil', to: 'estados#index', as: :estados
   get 'welcome/franquias'
   get 'welcome/ultrabook'
   get 'welcome/contato'

    resources :estados do
        resources :cidades, except:[:index, :update] do
          resources :lojas 
          end
       end


    resources :vehicle_brands do
      resources :vehicle_names
    end





    end

# get 'qualquer coisa', to: 'controller#path', as: :verbo
