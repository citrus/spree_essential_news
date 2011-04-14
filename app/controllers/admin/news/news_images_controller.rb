class Admin::Blog::ArticleImagesController < Admin::ResourceController
  
  before_filter :load_data

  create.before :set_viewable
  update.before :set_viewable
  destroy.before :destroy_before

  def update_positions
    params[:positions].each do |id, index|
      ArticleImage.update_all(['position=?', index], ['id=?', id])
    end

    respond_to do |format|
      format.js  { render :text => 'Ok' }
    end
  end
  
  private
  
  def location_after_save
    admin_article_images_url(@article)
  end

  def load_data
    @article = Article.find_by_path(params[:article_id])
  end

  def set_viewable
    @article_image.viewable = @article
  end

  def destroy_before
    @viewable = @article_image.viewable
  end

end