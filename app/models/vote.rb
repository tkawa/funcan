class Vote < ActiveRecord::Base
  #belongs_to :funcan, counter_cache: 'votes_count'
  belongs_to :user
  def self.types
    self.subclasses.map{|klass| klass.to_s.downcase }
  end
end

class Like < Vote
  belongs_to :funcan, counter_cache: 'like_count'
  def self.emoji_code; 'e00e' end
end

class Want < Vote
  belongs_to :funcan, counter_cache: 'want_count'
  def self.emoji_code; 'e427' end
end

class Great < Vote
  belongs_to :funcan, counter_cache: 'great_count'
  def self.emoji_code; 'e14c' end
end

class Interesting < Vote
  belongs_to :funcan, counter_cache: 'interesting_count'
  def self.emoji_code; 'e41b' end
end
