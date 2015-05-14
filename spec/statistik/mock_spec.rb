require 'spec_helper'

describe Statistik::Mock do  
  it 'should return a mock statistic identified by its id (without school)' do
    mock = Statistik::Mock.find 1234

    expect(mock.mock_id).to eql(value)
    expect(mock.mock_id).to eql(1234)
    expect(mock.questions_count).to eql(5)
    expect(mock.answers_count).to eql(20)
    expect(mock.answers_correct_count).to eql(10)
    expect(mock.answers_correct_rate).to eql(0.5)
    expect(mock.users_count).to eql(4)

    expect(mock.comparison).to be_nil
    expect(mock.school).to be_nil
  end

  it 'should include comparison and school using param :school_id => 123' do
    mock = Statistik::Mock.find 1234, query: {school_id: 123}
    
    expect(mock.comparison).to be_instance_of Statistik::MockComparison
    expect(mock.school).to be_instance_of Statistik::MockSchool

    expect(mock.comparison.answers_count).to eql(3)
    expect(mock.comparison.answers_correct_count).to eql(3)
    expect(mock.comparison.answers_correct_rate).to eql(1)
    expect(mock.comparison.users_count).to eql(1)
    
    expect(mock.school.school_id).to eql(123)
    expect(mock.school.answers_count).to eql(2)
    expect(mock.school.answers_correct_count).to eql(2)
    expect(mock.school.answers_correct_rate).to eql(1)
    expect(mock.school.users_count).to eql(1)
  end
end