REQUESTS_TO_CREATE = 1000
REQUESTS_TO_CREATE.times do
  @first_name = Faker::Name.first_name
  @last_name = Faker::Name.last_name
  @domain = Faker::Internet.domain_name
  @email = "#{@first_name}#{@last_name}@#{@domain}"
  Request.create! name:           "#{@first_name} #{@last_name}",
                  email:          @email,
                  department:     ['Sales','Marketing','Technical'].sample,
                  message:        Faker::Hipster.paragraph,
                  status:         [true, false].sample
end
