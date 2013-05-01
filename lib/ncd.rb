require 'zlib'
require "ncd/version"

module NCD
  def self.normalized_compression_distance(a, b)
    min, max = [a, b].map{|d| Zlib::Deflate.deflate(d, 9).size }.minmax
    cab = Zlib::Deflate.deflate(a+b, 9).size
    (cab - min) / max.to_f
  end
end

class String
  def ncd(b)
    NCD.normal_compression_distance(self, b)
  end
end
