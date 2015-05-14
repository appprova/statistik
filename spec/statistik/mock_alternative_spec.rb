require 'spec_helper'

describe Statistik::MockAlternative do  
  it "should return a MockAlternative statistic identified by its id (without comparison)" do
    mock_alternative = Statistik::MockAlternative.find 111, 555

    expect(mock_alternative).to be_instance_of Statistik::MockAlternative

    expect(mock_alternative.mock_id).to eq(111)
    expect(mock_alternative.alternative_id).to eq(555)
    expect(mock_alternative.answers_count).to eq(5)
    expect(mock_alternative.answers_correct_count).to eq(5)
    expect(mock_alternative.answers_correct_rate).to eq(1)

    expect(mock_alternative.comparison).to be_nil
    expect(mock_alternative.school).to be_nil
  end

  it "should include comparison and school using param school_id: 222" do
    mock_alternative = Statistik::MockAlternative.find 111, 555, query: {school_id: 222}

    expect(mock_alternative.comparison).to be_instance_of Statistik::MockComparison
    expect(mock_alternative.school).to be_instance_of Statistik::MockSchool

    expect(mock_alternative.school.school_id).to eq(222)
    expect(mock_alternative.school.answers_count).to eq(2)
    expect(mock_alternative.school.answers_correct_count).to eq(2)
    expect(mock_alternative.school.answers_correct_rate).to eq(1)

    expect(mock_alternative.comparison.answers_count).to eq(3)
    expect(mock_alternative.comparison.answers_correct_count).to eq(3)
    expect(mock_alternative.comparison.answers_correct_rate).to eq(1)
  end
end