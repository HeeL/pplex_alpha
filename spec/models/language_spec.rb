require 'spec_helper'

describe Language do
  subject { Language }

  it "looks for matching names" do
    lang1 = FactoryGirl.create(:language, name: 'Ruby')
    lang2 = FactoryGirl.create(:language, name: 'Ruby++')
    subject.match_names('Ru').should eql([lang1, lang2])
    subject.match_names('Ruby').should eql([lang1, lang2])
    subject.match_names('Ruby+').should eql([lang2])
    subject.match_names('Ruby+++').empty?.should be_true
  end

end
