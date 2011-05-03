namespace :db do
  namespace :sample do
    desc "creates sample news articles"
    task :news do
      
      require 'faker'
      require Rails.root.join('config/environment.rb')
        
      image_dir = File.expand_path("../sample", __FILE__)
      images    = Dir[image_dir + "/*.jpg"]
      
      product_ids = Product.select('id').all.collect(&:id) rescue []
      
      50.times { |i|
      
        article = Article.create(
          :title     => Faker::Lorem.sentence,
          :articleed_at => Time.now - i * rand(10000000),
          :body      => Faker::Lorem.paragraph,
          :tag_list  => Faker::Lorem.words(rand(10)).join(", ")
        )
        
        rand(5).times { |i|
          image = article.images.create(:attachment => File.open(images.sort_by{rand}.first), :alt => Faker::Lorem.sentence)
        }
        
        unless product_ids.empty?
          rand(5).times { |i|
            article.article_products.create(:product => Product.find(product_ids.sort_by{rand}.first), :position => i)
          }
        end
        
        print "*"
        
      }
      
      puts "\ndone."
      
    end
  end
end