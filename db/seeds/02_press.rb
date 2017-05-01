if Pressitem.count < 35
  35.times do |c|
    Pressitem.create! [
      created_at: Faker::Time.between(2.years.ago, Date.today, :all),
      title: Faker::Lorem.sentence,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
      sitename:  Faker::Book.title,
      link: 'http://google.com',
      body: Faker::Lorem.paragraph 
    ]
  end
end

