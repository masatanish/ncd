require 'zlib'
require_relative 'ncd/version'

module NCD
  def self.distance(a, b)
    min, max = [a, b].map{|d| Zlib::Deflate.deflate(d, 9).size }.minmax
    cab = Zlib::Deflate.deflate(a+b, 9).size
    (cab - min) / max.to_f
  end
end

class String
  def ncd(b)
    NCD.distance(self, b)
  end
end
