require 'rubygems'
require 'rmagick'

img = Magick::Image.read('download.png')[0]
img.each_pixel do |pixel, col, row|
  if pixel.red.to_i == 65535
    img.pixel_color(col,row,"black")
  end
end

img.write('whodunit.png')