 Simple blog project

Technologies
 - Rails 5.2.8.1
 - Ruby 2.7.2
 - Bootstrap 5

 Functionality
 - registration/login via Devise
 - authorization via Cancancan
 - search articles by titles
 - filtering by categories
 - pagination
 - likes for articles with 'acts_as_votable'
 - sorting articles by created_at and(or) rating(likes_count)
 - testing with Rspec
 - comments section for each article

 Only admin can see list of all users and delete user.
 Users can suggest new categories, but only admin can accept or decline those propositions.

 Admin:   
    email: admin@admin.com
    password: foobar
