require 'zlib'
require_relative 'ncd/version'

module NCD
  @@level = Zlib::BEST_COMPRESSION
  def self.distance(a, b)
    min, max = [a, b].map{|d| Zlib::Deflate.deflate(d, @@level).size }.minmax
    cab = Zlib::Deflate.deflate(a+b, @@level).size
    (cab.to_f - min.to_f) / max.to_f
  end
end

class String
  def ncd(b)
    NCD.distance(self, b)
  end
end
