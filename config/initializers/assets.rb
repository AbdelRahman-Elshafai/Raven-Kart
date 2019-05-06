# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( plugins.css.scss)
Rails.application.config.assets.precompile += %w( style.css)
Rails.application.config.assets.precompile += %w( custom.css)
Rails.application.config.assets.precompile += %w( 404.css )
Rails.application.config.assets.precompile += %w( 404.js )
Rails.application.config.assets.precompile += %w( js/vendor/modernizr-3.5.0.min.js )
Rails.application.config.assets.precompile += %w( js/vendor/jquery-3.2.1.min.js )
Rails.application.config.assets.precompile += %w( js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( js/popper.min.js )
Rails.application.config.assets.precompile += %w( js/plugins.js )
Rails.application.config.assets.precompile += %w( js/active.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
