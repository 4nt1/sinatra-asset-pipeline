require 'sinatra'
require 'sinatra/asset_pipeline'
require 'sinatra/asset_pipeline/task'

require 'rack/test'

class App < Sinatra::Base
  set :assets_prefix, %w(spec/assets)
  register Sinatra::AssetPipeline
end

class CustomApp < Sinatra::Base
  set :assets_prefix, %w(spec/assets, foo/bar)
  set :assets_precompile, %w(foo.css foo.js)
  set :assets_host, 'foo.cloudfront.net'
  set :assets_protocol, :https
  set :environment, :production
  set :assets_css_compressor, :sass
  set :assets_js_compressor, :uglifier
  register Sinatra::AssetPipeline
end

shared_context "assets" do
  let(:js_content) do
<<eos
(function() {
  (function() {});

}).call(this);
eos
  end

  let(:css_content) do
<<eos
html, body {
  margin: 0;
  padding: 0; }
eos
  end
end
