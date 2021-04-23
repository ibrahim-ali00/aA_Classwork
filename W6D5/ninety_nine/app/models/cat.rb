require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS =[
        'black',
        'white',
        'orange',
        'brown',
        'tabby'
    ]

    GENDER =[
        'M',
        'F'
    ]
    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion:  {in: COLORS}
    validates :sex, inclusion: {in: GENDER}

    def age
        time_ago_in_words(birth_date)
    end

    
end