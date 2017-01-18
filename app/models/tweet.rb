class Tweet < ActiveRecord::Base
    validates :content, presence: true, length: { in: 1..255 }
end
