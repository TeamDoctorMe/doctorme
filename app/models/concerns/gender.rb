module Gender
  extend ActiveSupport::Concern

  included do
    enum gender:  {
                    both: 0,
                    male: 1,
                    female: 0
                  }
  end
end
