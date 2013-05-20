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

  describe '.level' do
    subject { NCD.level }
    it 'should eq Zlib::BEST_COMPRESSION' do
      expect(subject).to eq Zlib::BEST_COMPRESSION
    end
  end

  describe '.level=' do
    let(:level_value) { 0 }
    subject { NCD.level = level_value }
    it { expect{ subject }.to change(NCD, :level).to(level_value) }
    context 'when invoke NCD.distance' do
      it 'level value should be assigned to arguments of Zlib::Defaulte.deflate method' do
        Zlib::Deflate.should_receive(:deflate).with(kind_of(String), level_value).exactly(3).times.and_return('aaa')
        subject
        NCD.distance(a, b)
      end
      after { NCD.level = Zlib::BEST_COMPRESSION }
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
