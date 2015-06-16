module Statistik
  class MockSchool < Base
    setup_delegators :@struct, :school_id,
                               :answers_count,
                               :answers_correct_count,
                               :answers_correct_rate,
                               :question_answers_count,
                               :question_answers_rate,
                               :users_count,
                               :alternative_color
  end
end