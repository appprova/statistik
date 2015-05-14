require 'spec_helper'

describe Statistik::Mock do  
  it 'should return a mock statistic identified by its id (without school)' do
    mock = Statistik::Mock.find 1234

    expect(mock.mock_id).to eq(1234)
    expect(mock.questions_count).to eq(5)
    expect(mock.answers_count).to eq(20)
    expect(mock.answers_correct_count).to eq(10)
    expect(mock.answers_correct_rate).to eq(0.5)
    expect(mock.users_count).to eq(4)

    expect(mock.comparison).to be_nil
    expect(mock.school).to be_nil
  end

  it 'should include comparison and school using param :school_id => 123' do
    mock = Statistik::Mock.find 1234, query: {school_id: 123}
    
    expect(mock.comparison).to be_instance_of Statistik::MockComparison
    expect(mock.school).to be_instance_of Statistik::MockSchool

    expect(mock.comparison.answers_count).to eq(3)
    expect(mock.comparison.answers_correct_count).to eq(3)
    expect(mock.comparison.answers_correct_rate).to eq(1)
    expect(mock.comparison.users_count).to eq(1)
    
    expect(mock.school.school_id).to eq(123)
    expect(mock.school.answers_count).to eq(2)
    expect(mock.school.answers_correct_count).to eq(2)
    expect(mock.school.answers_correct_rate).to eq(1)
    expect(mock.school.users_count).to eq(1)
  end
end