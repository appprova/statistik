require 'spec_helper'

describe Statistik::Mock do  
  it 'should return a mock statistic identified by its id (without school)' do
    mock = Statistik::Mock.find 1234
    mock.mock_id.should == 1234
    mock.questions_count.should == 5
    mock.answers_count.should == 20
    mock.answers_correct_count.should == 10
    mock.answers_correct_rate.should == 0.5
    mock.users_count.should == 4

    mock.comparison.should be_nil
    mock.school.should be_nil
  end

  it 'should include comparison and school using param :school_id => 123' do
    mock = Statistik::Mock.find 1234, query: {school_id: 123}
    
    mock.comparison.should be_instance_of Statistik::MockComparison
    mock.school.should be_instance_of Statistik::MockSchool

    mock.comparison.answers_count.should == 3
    mock.comparison.answers_correct_count.should == 3
    mock.comparison.answers_correct_rate.should == 1
    mock.comparison.users_count.should == 1
    
    mock.school.school_id.should == 123
    mock.school.answers_count.should == 2
    mock.school.answers_correct_count.should == 2
    mock.school.answers_correct_rate.should == 1
    mock.school.users_count.should == 1
  end
end