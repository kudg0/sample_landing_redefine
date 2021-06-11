# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :haml, {format: :html5}
set :es6, {format: :js}

activate :livereload

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings


#Inline the assets (js and css)
activate :sprockets

module AssetHelper
  # Renders a stylesheet asset inline.
  def inline_stylesheet(name)
    content_tag :style do
      sprockets["#{name}.css"].to_s
    end
  end

  ##
  # Renders a javascript asset inline.
  def inline_javascript(name)
    content_tag :script do
      sprockets["#{name}.js"].to_s
    end
  end
end

helpers AssetHelper

configure :build do
  activate :asset_hash
  activate :relative_assets
  activate :minify_html
  activate :minify_css, inline: true
end
