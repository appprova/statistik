require 'spec_helper'

describe Statistik::MockQuestion do
  it "should return a MockQuestion statistic identified by its id (without comparison)" do
    register(url: 'mocks/111/questions/444', body: 'questions_by_id')

    mock_question = Statistik::MockQuestion.find 111, 444

    expect(mock_question).to be_instance_of Statistik::MockQuestion

    expect(mock_question.mock_id).to eq(111)
    expect(mock_question.question_id).to eq(444)
    expect(mock_question.answers_count).to eq(5)
    expect(mock_question.answers_correct_count).to eq(5)
    expect(mock_question.answers_correct_rate).to eq(1)

    expect(mock_question.comparison).to be_nil
    expect(mock_question.school).to be_nil
  end

  it "should include comparison and school using param school_id: 222" do
    register(url: 'mocks/111/questions/444?school_id=222', body: 'questions_by_id_with_comparison')
    
    mock_question = Statistik::MockQuestion.find 111, 444, query: {school_id: 222}

    expect(mock_question.comparison).to be_instance_of Statistik::MockComparison
    expect(mock_question.school).to be_instance_of Statistik::MockSchool

    expect(mock_question.comparison.answers_count).to eq(3)
    expect(mock_question.comparison.answers_correct_count).to eq(3)
    expect(mock_question.comparison.answers_correct_rate).to eq(1)

    expect(mock_question.school.school_id).to eq(1)
    expect(mock_question.school.answers_count).to eq(2)
    expect(mock_question.school.answers_correct_count).to eq(2)
    expect(mock_question.school.answers_correct_rate).to eq(1)
  end
end