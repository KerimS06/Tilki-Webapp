Rails.application.routes.draw do
  get 'teachers/index'
  get 'students/index'
  get 'teachers/my_courses'
  get 'teachers/exam_dates'

  devise_for :students, path: 'students'
  devise_for :teachers, path: 'teachers'
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
