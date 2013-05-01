require 'zlib'
require_relative 'ncd/version'

module NCD
  def self.distance(a, b)
    min, max = [a, b].map{|d| Zlib::Deflate.deflate(d, Zlib::BEST_COMPRESSION).size }.minmax
    cab = Zlib::Deflate.deflate(a+b, Zlib::BEST_COMPRESSION).size
    (cab.to_f - min.to_f) / max.to_f
  end
end

class String
  def ncd(b)
    NCD.distance(self, b)
  end
end
