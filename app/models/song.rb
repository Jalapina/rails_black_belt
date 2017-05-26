class Song < ActiveRecord::Base
    validates :title, :artist, presence: :true, length:{minimum:1}
    validates :title, uniqueness: {case_sensitive: false}

    before_validation :added_field

    def added_field
        self.added = 0
    end

end
