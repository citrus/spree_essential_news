if defined?(PagesController) do
  PagesController.instance_eval do
    helper 'news/articles'
  end  
end