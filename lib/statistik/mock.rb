module Statistik
  class Mock < Base

    setup_delegators :@struct, :mock_id,
                               :url,
                               :questions_count,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :users_count,
                               :comparison,
                               :school,
                               :calculate

    relationship :comparison
    relationship :school

    class << self
      def find(mock_id, options = {})
        request 'mocks/:mock_id', 
                {mock_id: mock_id}, 
                options
      end

      def calculate(mock_id, options = {})
        options = {method: :put}.merge(options)
        request 'mocks/:mock_id/calculate',
                {mock_id: mock_id},
                options
      end
    end
  end
end