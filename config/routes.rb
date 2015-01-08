Rails.application.routes.draw do

  
   root 'welcome#index'

   get 'sobre-a-ultravisao', to: 'welcome#sobre', as: :sobre
   # get 'welcome/index'   
   get 'welcome/lojas'
   get 'welcome/franquias'
   get 'welcome/ultrabook'
   get 'welcome/contato'

    resources :estados do
        resources :cidades, except:[:index, :update] do
          resources :lojas 
          end
       end

    end

# get 'qualquer coisa', to: 'controller#path', as: :verbo
