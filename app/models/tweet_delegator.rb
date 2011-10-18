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

  def html(options = {})
    return @html if @html
    @html = [text.dup]
    entities_flat = entities.urls.map {|e| e.type = 'urls'; e }
    entities_flat += entities.hashtags.map {|e| e.type = 'hashtags'; e }
    entities_flat += entities.user_mentions.map {|e| e.type = 'user_mentions'; e }
    entities_flat.each do |entity|
      start_index, end_index = entity.indices
      @html.each_with_index do |fragment, i|
        fragment = fragment[:original] if fragment.is_a? Hash
        if fragment.length - 1 < start_index
          start_index -= fragment.length
          end_index -= fragment.length
          next
        end
        before = start_index == 0 ? nil : fragment.slice(0..start_index-1)
        content = fragment.slice(start_index..end_index-1)
        after = end_index == fragment.length ? nil : fragment.slice(end_index..-1)
        content = {original: content, entity: entity}
        @html[i] = [before, content, after].compact
        break
      end
      @html.flatten!
    end

    @html.map! do |fragment|
      if fragment.is_a? Hash
        e = fragment[:entity]
        case e.type
          when 'urls'
            %|<a href="#{e.url}" title="#{e.expanded_url}">#{e.display_url}</a>|
          when 'hashtags'
            options[e.text] ||
            %|<a href="http://twitter.com/search?q=%23#{e.text}">#{fragment[:original]}</a>|
          when 'user_mentions'
            %|<a href="http://twitter.com/#{e.screen_name}">#{fragment[:original]}</a>|
          else
            fragment[:original]
        end
      else
        fragment
      end
    end
    @html = @html.join
  end
end