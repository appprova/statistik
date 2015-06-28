module Statistik
  class MockSchool < Base
    setup_delegators :@struct, :school_id,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :question_answers_count,
                               :question_answers_rate,
                               :users_count,
                               :correct_alternative_answers_rate
  end
end