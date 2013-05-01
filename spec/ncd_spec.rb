require 'spec_helper'

def random_sting(len)
  len.times.map{ '%c' % rand(0..255) }.join.force_encoding('ascii-8bit')
end

describe NCD do
  let(:a) { random_sting(10000) }
  let(:b) { random_sting(10000) }

  describe '.distance' do
    context 'when assigned values are same.' do
      subject { NCD.distance(a, a) }
      it { expect(subject).to be < 0.1 }
    end
    context 'when assign 2 random strings.' do
      subject { NCD.distance(a, b) }
      it { expect(subject).to be > 0.9 }
    end
  end

  describe 'String#ncd' do
    context 'when assigned values are same.' do
      it { expect(a.ncd(a)).to be < 0.1 }
    end
    context 'when assign 2 random strings.' do
      it { expect(a.ncd(b)).to be > 0.9 }
    end
  end
end
