class TweetDelegator < SimpleDelegator
  def count(type)
    if @funcan.nil?
      @funcan = Funcan.find_by_sid(id_str)
    end
    if @funcan
      @funcan.send("#{type}_count".to_sym)
    else
      @funcan = false
      0
    end
  end
end