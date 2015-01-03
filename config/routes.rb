Rails.application.routes.draw do

  root 'dishes#index'
  scope :api, defaults: {format: :json} do
    resources :ingredients, except: [:new, :edit] do
      collection do
        get 'byGroup', to: 'ingredients#findByDish'
      end
    end
    resources :variables, only: [:show, :update] do
      collection do
        get 'findByName', to: 'variables#findByName'
      end
    end
    resources :dishes, except: [:new, :edit] do
      collection do
        get 'group/:group_id', to: 'dishes#getByGroup'
      end
    end

    resources :dish_groups, except: [:new, :edit]

    resources :food_groups, except: [:new, :edit]

    resources :foods, except: [:new, :edit] do
      collection do
        get 'group/:group_id', to: 'foods#getByGroup'
      end
    end
  end

end
