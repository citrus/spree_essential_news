class Admin::News::ArticlesController < Admin::ResourceController

  private
  
    def location_after_save
      object_url
    end
    
    def find_resource
	  	@object ||= Article.find_by_path(params[:id])
    end
    
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "posted_at.desc"
      @search = Article.metasearch(params[:search])
      @collection = @search.paginate(:per_page => Spree::Config[:orders_per_page], :page => params[:page])
    end

end