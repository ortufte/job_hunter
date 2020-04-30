require 'faker'

User.destroy_all
Opportunity.destroy_all
Qualification.destroy_all
Task.destroy_all

=begin

20.times do 
    Qualification.create([{
        description: Faker::Company.buzzword
}])
end

2.times do
    User.create([{
        name: Faker::Name.unique.name, 
        email: Faker::Internet.email, 
        password: '123456',
        password_confirmation: '123456',
        qualification_ids: [Faker::Number.between(from: 1, to: 18)]
}])
end


10.times do 
    Opportunity.create([{
        title: Faker::Job.title, 
        company: Faker::Company.name, 
        location: Faker::Address.city, 
        contact: Faker::Name.name, 
        phone: Faker::PhoneNumber.phone_number, 
        email: Faker::Internet.email, 
        job_listing: Faker::Internet.url, 
        closed: Faker::Boolean.boolean(true_ratio: 0.2), 
        user_id: Faker::Number.between(from: 1, to: 4),
        qualification_ids: [Faker::Number.within(range: 1..19),
                            Faker::Number.within(range: 1..19),
                            Faker::Number.within(range: 1..19)],
}])    
end

=end

#20.times do 
    Task.create([{
        description: "description",
        #priority: Faker::Number.between(from: 1, to: 5),
        #complete: 'false',
        #opportunity_id: Faker::Number.between(from: 1, to: 10)
   }])
#end


