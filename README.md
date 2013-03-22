# sinatra-asset-pipeline

An asset pipeline implementation for Sinatra based on Sprockets including HAML, SASS and CoffeeScript support.

# Installation

Install sinatra-asset-pipeline from RubyGems:

    $ gem install sinatra-asset-pipeline

Or include it in your project's Gemfile with Bundler:

    gem 'sinatra-asset-pipeline'

Make sure to add the sinatra-asset-pipeline Rake task in your applications Rakefile:

    require 'sinatra/asset_pipeline/task.rb'
    require './app'

    Sinatra::AssetPipeline::Task.define! App

Now, when everything is in place you can precompile assets with:

    rake assets:precompile

And remove old compiled assets with:

    rake assets:clean

# Example

In it's most simple form you just register the Sinatra::AssetPipe Sinatra extension within your Sinatra app.

    Bundler.require

    require 'sinatra/asset_pipeline'

    class App < Sinatra::Base
      register Sinatra::AssetPipeline

      get '/' do
        haml :index
      end
    end

However, if you want to be more fancy, you can customize almost all aspects of sinatra-asset-pipeline. Here is a more elaborate example.

      Bundler.require

      require 'sinatra/asset_pipeline'

      class App < Sinatra::Base
        register Sinatra::AssetPipeline

        # Which files should be included in the precompile
        set :assets_precompile, %w(app.js app.css *.png *.jpg *.svg *.eot *.ttf *.woff)

        # Where are the assets located
        set :assets_prefix, 'assets'

        # Which protocol should we use to serve assets
        set :assets_protocol, 'http'

        get '/' do
          haml :index
        end
      end

Now when everything is in place you can use all helpers provided by [sprockets-helpers](https://github.com/petebrowne/sprockets-helpers), here is a small example:

      body {
        background-image: image-url('cat.png');
      }

