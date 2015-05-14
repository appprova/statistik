module Statistik
  class MockAlternative < Base

    setup_delegators :@struct, :mock_id,
                               :alternative_id,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :comparison,
                               :school

    relationship :comparison
    relationship :school

    class << self
      def find(mock_id, alternative_id, options = {})
        request 'mocks/:mock_id/alternatives/:alternative_id', 
                {mock_id: mock_id, alternative_id: alternative_id}, 
                options
      end
    end
  end
end