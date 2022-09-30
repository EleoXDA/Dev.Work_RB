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

addresses = ['Geneva', 'Zurich', 'Bern', 'Cambridge', 'Oxford', 'Kathmandu', 'Berlin', 'Frankfurt', 'Paris', 'Bristol',
             'Paris', 'Essen', 'Lyon', 'Kyiv', 'Madrid', 'Porto', 'Lisbon', 'Seville', 'Palermo', 'Vienna', 'Delhi',
             'San Francisco', 'Washington', 'Nairobi', 'Melbourne', 'Canberra', 'Montreal', 'Beijing', 'Tokyo',
             'Mumbai', 'Osaka', 'Istanbul', 'Rio de Janeiro', 'Jakarta', 'Chicago']

array = ["https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1558287340-ac154cb1b31b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=927&q=80",
         "https://images.unsplash.com/photo-1552162864-987ac51d1177?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1514501259756-f4b6fbeffa67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1595273185163-347066c49ad3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1592158169526-9deda479afce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=860&q=80",
         "https://images.unsplash.com/photo-1534330786040-317bdb76ccff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=917&q=80",
         "https://images.unsplash.com/photo-1584308972272-9e4e7685e80f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1596935884412-2caade8438a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1485206412256-701ccc5b93ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80",
         "https://images.unsplash.com/photo-1605087880595-8cc6db61f3c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1547212371-eb5e6a4b590c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1597004897768-c503466472cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1534126416832-a88fdf2911c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1532318065232-2ba7c6676cd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=923&q=80",
         "https://images.unsplash.com/photo-1526382925646-27b5eb86796e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1579503841516-e0bd7fca5faa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1536792414922-14b978901fcd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1515175704145-8a06ffce6b77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=896&q=80",
         "https://images.unsplash.com/photo-1608153488161-803b502750fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1595897952944-878f3abafb5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1558216144-fef86b75da36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1562045726-c54c4d58b602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1601234699404-4867fa71f87f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=865&q=80",
         "https://images.unsplash.com/photo-1585837146751-a44118595680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=858&q=80",
         "https://images.unsplash.com/photo-1541576980233-97577392db9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=884&q=80",
         "https://images.unsplash.com/photo-1571988654190-ef2bfb6fb147?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1592334873219-42ca023e48ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=861&q=80",
         "https://images.unsplash.com/photo-1585042570881-d5c0cb418ed8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1534644586429-7681a71bc591?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1509112756314-34a0badb29d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=931&q=80",
         "https://images.unsplash.com/photo-1513091550446-33297bfca05b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
         "https://images.unsplash.com/photo-1529068755536-a5ade0dcb4e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=881&q=80"]

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

# lang.size.times do
lang.each do |filter|
  filter = Filter.new(name: filter)
  filter.save!
  filter_array << filter
end

user_array = []

20.times do
  puts "Creating users!"
  user = User.new(nickname: Faker::Name.first_name,
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456")
  user.photo.attach(io: URI.open(array.sample), filename: "profile.png", content_type: "image/png")
  user.save!
  user_array << user
end

50.times do
  puts "Creating challenges!"
  challenge = Challenge.new(title: title.sample,
                            content: content.sample,
                            price_max: rand(100),
                            deadline: Faker::Date.between(from: '2022-09-10', to: '2022-12-31'),
                            filter: filter_array.sample,
                            user: user_array.sample,
                            location: addresses.sample)
  challenge.save!
end

puts "Seeds added..."
