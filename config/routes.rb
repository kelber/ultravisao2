Rails.application.routes.draw do

  get 'home/index'

  get 'home/show'

  get 'home/edit'

  get 'ultrabook/index'

  get 'ultrabook/show'

  get 'ultrabook/edit'

  devise_for :franqueados
  devise_for :vistoriadores

  devise_for :managers

 

   root 'welcome#index'



   get 'sobre-a-ultravisao', to: 'welcome#sobre', as: :sobre
   # get 'welcome/index'   
   get 'welcome/franquias'
   # get 'welcome/ultrabook'
   get 'welcome/contato'
   # tentativa get 'welcome/principal'  # , to: 'welcome#principal', as: :main

    resources :estados do
        resources :cidades, except:[:index, :update] do
          resources :lojas 
          end
       end


    resources :vehicle_brands do
      resources :vehicle_names do
        resources :comments do
          member do
          get "like", to: "comments#upvote"
          get "dislike", to: "comments#downvote"
          end

          member do 
            patch :complete 
          end 

        end
      end
    end

   resources :ultrabook



    end

# get 'qualquer coisa', to: 'controller#path', as: :verbo
