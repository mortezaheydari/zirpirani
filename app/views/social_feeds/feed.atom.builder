atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @featured_posts.each do |post|
    next if post.updated_at.blank?

    feed.entry( post ) do |entry|
      entry.url post_url(post)
      entry.title post.title
      entry.image post.image.url(:large)

      # the strftime is needed to work with Google Reader.
      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author do |author|
        author.name  post.owner.name
      end
    end
  end
end
