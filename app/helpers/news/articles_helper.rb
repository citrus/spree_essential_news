module News::ArticlesHelper

  def article_seo_path(article)
    full_article_path(article.year, article.month, article.day, article.to_param)
  end
  
  def article_seo_url(article)
    full_article_url(article.year, article.month, article.day, article.to_param)
  end
  
  def article_rss(article)
    output = []
    article.images.each do |image|
      output << image_tag(image.attachment.url, :alt => image.alt)
    end
    output << article.rendered_body
    output.join("\n").html_safe
  end
  
  def date_full(date)
    date.strftime('%A %B %d, %Y').gsub(/\s0/, ' ')
  end

end