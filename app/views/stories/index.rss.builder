xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Harlen Stories"
    xml.description "Recent articles from the Harlen Collection blog"
    xml.link root_url

    @stories.each do |story|
      xml.item do
        xml.title story.title
        xml.description excerpt(story.body)
        xml.pubDate story.created_at.to_s(:rfc822)
        xml.link story_url(story)
        xml.guid story_url(story)
      end
    end
  end
end
