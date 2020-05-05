require 'faker'

User.destroy_all
Opportunity.destroy_all
Qualification.destroy_all
Task.destroy_all



20.times do 
    Qualification.create([{
        description: Faker::Company.buzzword
}])
end

1.times do
    User.create([{
        name: Faker::Name.unique.name, 
        email: Faker::Internet.email, 
        password: '123456',
        password_confirmation: '123456',
        qualification_ids: [Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18)]
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
        closed: Faker::Boolean.boolean(true_ratio: 0.5), 
        user_id: User.first.id,
        created_at: Faker::Time.backward(days: 30),
        qualification_ids: [Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18),
                            Faker::Number.between(from: 1, to: 18)],
        tasks_attributes: [{
                            description: Faker::Verb.base,
                            priority: Faker::Number.between(from: 1, to: 5),
                            complete: Faker::Boolean.boolean(true_ratio: 0.3),
                            created_at: Faker::Time.backward(days: 30)
                            },
                            {
                            description: Faker::Verb.base,
                            priority: Faker::Number.between(from: 1, to: 5),
                            complete: Faker::Boolean.boolean(true_ratio: 0.3),
                            created_at:Faker::Time.backward(days: 30)
                            },
                            {
                            description: Faker::Verb.base,
                            priority: Faker::Number.between(from: 1, to: 5),
                            complete: Faker::Boolean.boolean(true_ratio: 0.3),
                            created_at: Faker::Time.backward(days: 30)
                            },
                            {
                            description: Faker::Verb.base,
                            priority: Faker::Number.between(from: 1, to: 5),
                            complete: Faker::Boolean.boolean(true_ratio: 0.3),
                            created_at: Faker::Time.backward(days: 30)
                            }]
}])    
end



