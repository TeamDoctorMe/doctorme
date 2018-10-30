module Gender
  extend ActiveSupport::Concern

  included do
    enum gender:  {
                    both: 0,
                    male: 1,
                    female: 2
                  }

    scope :within_gender, -> (gen) {
                                      where('gender = ? OR gender = ?', Symptom.genders['both'], Symptom.genders[gen])
                                    }

  end
end
