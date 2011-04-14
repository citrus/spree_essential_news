require 'generators/essentials_base'

module SpreeEssentialNews
  module Generators
    class InstallGenerator < SpreeEssentials::Generators::EssentialsBase
      
      desc "Installs required migrations for spree_essentials_blog"
      source_root File.expand_path("../../templates/db/migrate", __FILE__)

      def copy_migrations
        migration_template "create_articles.rb",              "db/migrate/create_articles.rb"
        migration_template "create_article_products.rb",      "db/migrate/create_article_products.rb"
        migration_template "acts_as_taggable_on_articles.rb", "db/migrate/acts_as_taggable_on_articles.rb"
      end

    end
  end
end