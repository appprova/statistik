require 'spec_helper'

describe Statistik::MockUser do  
  it "should return a MockUser statistic identified by mock and user ids" do
    register(url: 'mocks/111/users/333', body: 'users_by_id')
    
    mock_user = Statistik::MockUser.find 111, 333

    expect(mock_user.mock_id).to eq(111)
    expect(mock_user.user_id).to eq(333)
    expect(mock_user.answers_count).to eq(5)
    expect(mock_user.answers_correct_count).to eq(4)
    expect(mock_user.answers_correct_rate).to eq(1)
    expect(mock_user.answers_comparison_rate).to eq(0.75)

    expect(mock_user.comparison).to be_instance_of Statistik::MockComparison
    expect(mock_user.comparison.questions_count).to eq(12)
    expect(mock_user.comparison.answers_correct_count).to eq(8)
    expect(mock_user.comparison.answers_correct_rate).to eq(0.66)
  end
end