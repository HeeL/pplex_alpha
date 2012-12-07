require 'spec_helper'

describe Language do
  subject { Language }
  
  context 'match found' do
    before :each do
      @lang1 = FactoryGirl.create(:language, name: 'Ruby')
      @lang2 = FactoryGirl.create(:language, name: 'Ruby++')
    end

    it "finds matching names" do
      subject.match_names('Ru').should eql([@lang1, @lang2])
      subject.match_names('Ruby').should eql([@lang1, @lang2])
      subject.match_names('Ruby+').first.should eql(@lang2)
    end

    it 'ignores the case of letters' do
      subject.match_names('RuBy++').first.should eql(@lang2)
    end
  end
  
  context 'nothing found' do
    let(:result) { subject.match_names('something') }

    it 'returns an empty array' do
      result.should eq([])
    end
    
  end

  context 'bad name provided' do

    it 'returns an empty array for nil' do
      subject.match_names(nil).should eq([])
    end
    
    it 'returns an empty array for false' do
      subject.match_names(false).should eq([])
    end
    
    it 'returns an empty array for empty string' do
      subject.match_names('').should eq([])
    end

  end  

end
