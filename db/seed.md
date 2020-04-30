# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Opportunity.destroy_all
Qualification.destroy_all
UserQualification.destroy_all
Task.destroy_all


users = [{name: "Name", email: "email@email.com", password: "password", password_confirmation: "password"},
        {name: "Kate", email: "katie@katie.com", password: "password1", password_confirmation: "password1"},   
        {name: "Will", email: "will@will.com", password: "password2", password_confirmation: "password2"}]

users.each do |user|
    User.create(user)
end

opportunities = [{title: "Developer", company: "IBM", location: "Rochester, MN", contact: "recruiter", phone: "000-000-0000", email: "ibm@ibm.com", job_listing: "www.ibm.com", closed: true, user_id: 21},
                {title: "Entry Level Software Engineer", company: "Facebook", location: "Remote", contact: "Zuckerberg", email: "facebook@facebook.com", job_listing: "www.facebook.com", user_id: 21},
                {title: "Developer", company: "Twitter", location: "San Francisco, CA", contact: "HR Representative", phone: "000-000-0000", job_listing: "www.twitter.com", user_id: 21},
                {title: "Waitress", company: "Dock Cafe", location: "Stillwater, MN", contact: "Mary", phone: "000-000-0000", closed: true, user_id: 22},
                {title: "Hostess", company: "Lolo", location: "MN", phone: "000-000-0000", email: "lolo@lolo.com", user_id: 22},
                {title: "Dishwasher", company: "Acapulco", location: "Stillwater Blvd", contact: "Elizabeth", phone: "000-000-0000", job_listing: "www.acapulco.com", user_id: 22},
                {title: "Project Manager", company: "Zintl", location: "WA", contact: "Judson", phone: "000-000-0000", email: "judson@judson.com", job_listing: "www.zintl.com", closed: true, user_id: 23},
                {title: "Service Operations Manger", company: "Johnson Controls", location: "St. Paul, MN", contact: "Charlene", job_listing: "www.johnsoncontrols.com", user_id: 23},
                {title: "Executive Assistant", company: "Harty", location: "Minneapolis, MN", contact: "recruiter", phone: "000-000-0000", email: "hm@hm.com", user_id: 23}]

opportunities.each do |opportunity|
    Opportunity.create(opportunity)
end

qualifications = [{description: "Computer Science Degree"},
                {description: "High School Diploma"},
                {description: "Excellent Verbal and Written Communication"},
                {description: "Attention to Detail"},
                {description: "Ability to Lift 50 Lbs"},
                {description: "Positive Attitude"},
                {description: "1 Year Experience"},
                {description: "SQL"},
                {description: "Python"},
                {description: "Dependability"}]

qualifications.each do  |qualification|
    Qualification.create(qualification)
end


user_qualifications = [{user_id: 1, qualification_id: 1, comment: "Graduated 2010"},
                        {user_id: 1, qualification_id: 7, comment: "Internship"},
                        {user_id: 1, qualification_id: 4},
                        {user_id: 2, qualification_id: 2, comment: "Graduated 2019"},
                        {user_id: 2, qualification_id: 6},
                        {user_id: 2, qualification_id: 10, comment: "Punctual"},
                        {user_id: 3, qualification_id: 3},
                        {user_id: 3, qualification_id: 5},
                        {user_id: 3, qualification_id: 6, comment: "Glass Half Full"}]

user_qualifications.each do |user_qualification|
    UserQualification.create(user_qualification)
end


tasks = [{description:"Update Resume", priority: 1, opportunity_id: 1 },
        {description:"Update LinkedIn", priority: 2, opportunity_id: 3 },
        {description:"Follow Up Call", priority: 2, opportunity_id: 4 },
        {description:"Write Cover Letter", priority: 3, opportunity_id: 2 },
        {description:"Drop off Resume", priority: 1, opportunity_id: 6 },
        {description:"Reference Letter", priority: 1, opportunity_id: 7 },
        {description:"Update Resume", priority: 2, opportunity_id: 8 }]


tasks.each do |task|
    Task.create(task)
end