Rails.application.routes.draw do
  get '/mark_as_read/:type/:id.gif' => 'mark_as_read/mark_as_read#read'
end