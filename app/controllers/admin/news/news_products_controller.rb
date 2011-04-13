class Admin::News::ArticleProductsController < Admin::BaseController
  
  before_filter :load_data
  
  def create
    position = @article.products.count
    @product = Variant.find(params[:variant_id]).product
    ArticleProduct.create(:article_id => @article.id, :product_id => @product.id, :position => position)
    render :partial => "admin/blog/article_products/related_products_table", :locals => { :article => @article }, :layout => false 
  end
    
  def destroy
    @related = ArticleProduct.find(params[:id])
    if @related.destroy
      render_js_for_destroy
    end
  end
    
  private
  
    def load_data
	  	@article = Article.find_by_path(params[:article_id])
    end

end