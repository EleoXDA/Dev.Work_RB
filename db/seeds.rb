# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Booking.destroy_all
Challenge.destroy_all
Filter.destroy_all
User.destroy_all

puts "Generating seeds..."

lang = ['Java', 'Kotlin', 'Ruby', 'Javascript', 'Swift', 'Dart', 'CSS',
        'HTML', 'Bash', 'XML', 'C++', 'Rust', 'Pascal', 'Fortran', 'PHP',
        'Perl']

title = ['Diagnostics fail to Load', 'Need a hand with Partials', 'Compilation Error', 'Runtime issue - Cannot load',
         "Says 'Unexpected program Termination'", 'System Failure after many repeats',
         'Poor performance - Need to change framework', 'Library subroutine failure right before presentation',
         'Client is not happy - Please guide', 'Fix this join us', 'Shows syntax error and nobody has information',
         'Incorrect program design - Urgent', 'Stuck in infinite loop - No way out', 'Logics fail - no clue - Urgent']

addresses = ["Geneva", "Zurich", "Bern", "Cambridge", "Oxford", "Kathmandu", "Berlin", "Frankfurt", "Paris", "Bristol",
             "Paris", "Essen", "Lyon", "Kyiv", "Madrid", "Porto", "Lisbon", "Seville", "Palermo", "Vienna", "Delhi",
             "San Francisco", "Washington", "Nairobi", "Melbourne", "Canberra", "Montreal", "Beijing", "Tokyo",
             "Mumbai", "Osaka", "Istanbul", "Rio de Janeiro", "Jakarta", "Chicago"]

array = ["https://gravatar.com/avatar/38e6bc27f9d54cca67426924eb366a51?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/649d7427af905218ac3e3fc2c2e6c2d4?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/f00a238b97348910aeb3a18ac7920301?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/07b5a65d00de168c8d8e4e1f8044b129?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/01e150e9db07023122c524d0e58addea?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/70f155619cdd9f45ea23f3039940ef0d?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/e0399004b9c37b2c35525ad34c119620?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/dc0d182da3d2c3ee00549396b264e60b?s=200&d=robohash&r=x",
         "https://gravatar.com/avatar/18b00cafdca2767b9afb62b368110b7a?s=200&d=robohash&r=x"]

content = ['Here is a piece of code that shows some very peculiar behavior. For some strange reason, sorting the
            data (before the timed region) miraculously makes the loop almost six times faster. (Sorting itself takes
            more time than this one pass over the array, so it is not actually worth doing if we needed to calculate
            this for an unknown array). My first thought was that sorting brings the data into the cache, but then I
            thought how silly that was because the array was just generated.', "What are the stack and heap?
            Where are they located physically in a computer's memory? To what extent are they controlled by the OS or
            language run-time? What is their scope? What determines their sizes? What makes one faster?", "How do I
            toggle the visibility of an element using .hide(), .show(), or .toggle()? How do I test if an element is
            visible or hidden?", "Recently, I ran some of my code through Crockford's JSLint, and it gave the following
            error: 'Problem at line 1 character 1: Missing 'use strict' statement'. Doing some searching, I realized
            that some people add 'use strict'; into their code. Once I added the statement, the error stopped appearing.
            Unfortunately, Google did not reveal much of the history behind this string statement. Certainly it must
            have something to do with how it is interpreted by the browser, but I have no idea what the effect would be.
            So what is 'use strict'; all about, what does it imply, and is it still relevant? Do any of the current
            browsers respond to the 'use strict'; string or is it for future use?", "How would you explain closures to
            someone with a knowledge of the concepts they consist of (for example functions, variables and the like),
            but does not understand closures themselves? I have seen the Scheme example given on Wikipedia, but
            unfortunately it did not help.", "I am planning to execute a shell script on a remote server using Ansible
            playbook.
            blank test.sh file:
            touch test.sh
            Playbook:
            ---
            - name: Transfer and execute a script.
              hosts: server
              user: test_user
              sudo: yes
              tasks:
                 - name: Transfer the script
                   copy: src=test.sh dest=/home/test_user mode=0777
                 - name: Execute the script
                   local_action: command sudo sh /home/test_user/test.sh
            When I run the playbook, the transfer successfully occurs but the script is not executed.", "I have a
            long-running docker build process, so I would prefer not to disable caching for the entire build
            (with --no-cache). However, I would like to invalidate caching for a particular step.

            I had a bright idea: remove the cached layer and rebuild so this has to rebuild.

            I used:

            docker build --progress=plain
            to get hold of the sha of the cached layer:

            #16 [stage-9  3/15] RUN pip install -r /tmp/requirements.lock
            #16 sha256:e4ac79a1eac5702cd296ccf33a1cfa2e0c3890c77d42737dc62a3b26ac3e798e
            #16 CACHED
            But then I got this error

            > docker rmi e4ac79a1eac5702cd296ccf33a1cfa2e0c3890c77d42737dc62a3b26ac3e798
            Error: No such image: e4ac79a1eac5702cd296ccf33a1cfa2e0c3890c77d42737dc62a3b26ac3e798
            Is there an (easy) way of deleting this layer?

            Note: For most use cases (and maybe even this one) you might like to use the --no-cache option for docker
            build"]

filter_array = []
20.times do
  filter = Filter.new(name: lang.sample)
  filter.save!
  filter_array << filter
end

user_array = []
20.times do
  user = User.new(nickname: Faker::FunnyName.name,
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456",
                  image_url: array.sample)
  user.save!
  user_array << user
end

50.times do
  challenge = Challenge.new(title: title.sample,
                            content: content.sample,
                            price_max: rand(100),
                            deadline: Faker::Date.between(from: '2022-09-10', to: '2022-12-31'),
                            filter: filter_array.sample,
                            user: user_array.sample,
                            location: addresses.sample)
  challenge.save!
end

400.times do
  booking = Booking.new(review: Faker::TvShows::Friends.quote, price: rand(100), date: Date.today, challenge: Challenge.all.sample, user: User.all.sample)
  booking.save!
end

puts "Seeds added..."
