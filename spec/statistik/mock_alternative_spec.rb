require 'spec_helper'

describe Statistik::MockAlternative do  
  it "should return a MockAlternative statistic identified by its id (without comparison)" do
    register(url: 'mocks/111/alternatives/555', body: 'alternatives_by_id')

    mock_alternative = Statistik::MockAlternative.find 111, 555

    expect(mock_alternative).to be_instance_of Statistik::MockAlternative

    expect(mock_alternative.mock_id).to eq(111)
    expect(mock_alternative.alternative_id).to eq(555)
    expect(mock_alternative.answers_count).to eq(5)
    expect(mock_alternative.question_answers_count).to eq(5)
    expect(mock_alternative.question_answers_rate).to eq(1)
    expect(mock_alternative.correct_alternative_answers_rate).to eq(1.3)

    expect(mock_alternative.comparison).to be_nil
    expect(mock_alternative.school).to be_nil
  end

  it "should include comparison and school using param school_id: 222" do
    register(url: 'mocks/111/alternatives/555?school_id=222', body: 'alternatives_by_id_with_comparison')
    
    mock_alternative = Statistik::MockAlternative.find 111, 555, query: {school_id: 222}

    expect(mock_alternative.comparison).to be_instance_of Statistik::MockComparison
    expect(mock_alternative.school).to be_instance_of Statistik::MockSchool

    expect(mock_alternative.school.school_id).to eq(222)
    expect(mock_alternative.school.answers_count).to eq(2)
    expect(mock_alternative.school.question_answers_count).to eq(2)
    expect(mock_alternative.school.question_answers_rate).to eq(1)
    expect(mock_alternative.school.correct_alternative_answers_rate).to eq(1)

    expect(mock_alternative.comparison.answers_count).to eq(3)
    expect(mock_alternative.comparison.question_answers_count).to eq(3)
    expect(mock_alternative.comparison.question_answers_rate).to eq(1)
  end
end