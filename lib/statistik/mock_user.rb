module Statistik
  class MockUser < Base

    setup_delegators :@struct, :user_id,
                               :mock_id,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :answers_comparison_rate,
                               :comparison

    relationship :comparison

    class << self

      def find(mock_id, user_id, options = {})
        request 'mocks/:mock_id/users/:user_id',
                {mock_id: mock_id, user_id: user_id},
                options
      end

    end

  end
end