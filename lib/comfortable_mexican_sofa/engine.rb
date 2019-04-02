require 'rubygems'
require 'comfortable_mexican_sofa'
require 'rails'
require 'rails-i18n'
require 'bootstrap_form'
require 'active_link_to'
require 'paperclip'
require 'kramdown'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'haml-rails'
require 'sass-rails'
require 'coffee-rails'
require 'codemirror-rails'
#require 'bootstrap-sass'
require 'plupload-rails'

module ComfortableMexicanSofa
  class Engine < ::Rails::Engine
    
    initializer "comfortable_mexican_sofa.setup_assets" do
      ::ComfortableMexicanSofa::Engine.config.assets.precompile += %w[
        comfy/admin/cms/application.js
        comfy/admin/cms/application.css
        comfy/admin/cms/lib/glyphicons-halflings-regular.svg
        comfy/admin/cms/lib/glyphicons-halflings-regular.ttf
        comfy/admin/cms/lib/glyphicons-halflings-regular.woff
        comfy/admin/cms/lib/glyphicons-halflings-regular.woff2
        comfy/admin/cms/lib/redactor-font.eot
      
      ]
    end
    
    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/comfortable_mexican_sofa/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
