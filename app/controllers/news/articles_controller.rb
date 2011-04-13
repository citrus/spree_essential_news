class News::ArticlesController < Spree::BaseController

  helper :products
  
  before_filter :get_sidebar, :only => [:index, :search, :show]
  
  def index
    @articles_by_month = Article.live.limit(50).group_by { |article| article.posted_at.strftime("%B %Y") }
    scope = Article.live
    if params[:year].present?
      year  = params[:year].to_i
      month = 1
      day   = 1  
      if has_month = params[:month].present?
        if has_day = params[:day].present?
          day  = params[:day].to_i
        end
        month = params[:month].to_i
      end
      start = Date.new(year, month, day)
      stop  = start + 1.year
      if has_month
        stop = start + 1.month
        if has_day
          stop = start + 1.day
        end
      end    
      scope = scope.where("posted_at >= ? AND posted_at <= ?", start, stop)
    end
    @articles = scope.paginate(:page => params[:page], :per_page => Article.per_page)
  end
  
  def search
		query = params[:query].gsub(/%46/, '.')	
		@articles = Article.live.tagged_with(query).paginate(:page => params[:page], :per_page => Article.per_page)
		get_tags		
		render :template => 'blog/articles/index'
	end
	
  def show
    @article = Article.live.includes(:tags, :images, :products).find_by_path(params[:id]) rescue nil
    return redirect_to archive_articles_path unless @article
  end
  
	def archive
		@articles = Article.live.all
	end
  
  def get_sidebar    
    @archive_articles = Article.live.limit(10)
    get_tags
  end
  
  def get_tags
    @tags = Article.live.tag_counts.order('count DESC').limit(25)
  end

end