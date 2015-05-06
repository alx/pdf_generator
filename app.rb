require "cuba"
require "shrimp"
require "send_file"
require "./pdf_render.rb"

Cuba.plugin(SendFile)
Cuba.use(Shrimp::PdfRender, {:out_path => "/home/alx/pdf.tactac.cat/output"})

Shrimp.configure do |config|
  config.margin    = "0cm"
  config.phantomjs = "/usr/local/bin/phantomjs"
end

Cuba.define do
  on root do
    on param("url") do |url|
      send_file(Shrimp::Phantom.new(url).to_file)
    end
  end
end
