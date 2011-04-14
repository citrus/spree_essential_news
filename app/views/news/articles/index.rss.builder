xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{Spree::Config[:site_name]} - Blog"
    xml.description "#{Spree::Config[:site_url]} - Blog"
    xml.link articles_url

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article_rss(post)
        xml.pubDate article.posted_at.to_s(:rfc822)
        xml.link article_seo_path(post)
      end
    end
  end
end