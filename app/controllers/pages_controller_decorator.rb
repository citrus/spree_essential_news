if defined?(PagesController)
  PagesController.instance_eval do
    helper 'news/articles'
  end  
end