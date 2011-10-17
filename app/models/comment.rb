class Comment < ActiveRecord::Base
  belongs_to :tweet, counter_cache: true
end

class Like < Comment
  belongs_to :tweet, counter_cache: 'like_count'
end

class Want < Comment
  belongs_to :tweet, counter_cache: 'want_count'
end

class Great < Comment
  belongs_to :tweet, counter_cache: 'great_count'
end

class Interesting < Comment
  belongs_to :tweet, counter_cache: 'interesting_count'
end
