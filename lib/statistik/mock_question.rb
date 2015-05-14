module Statistik
  class MockQuestion < Base

    setup_delegators :@struct, :mock_id,
                               :question_id,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :comparison,
                               :school

    relationship :comparison
    relationship :school

    class << self

      def find(mock_id, question_id, options = {})
        request 'mocks/:mock_id/questions/:question_id',
                {mock_id: mock_id, question_id: question_id},
                options
      end

    end
  end
end