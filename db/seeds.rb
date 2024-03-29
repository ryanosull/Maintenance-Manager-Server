require 'faker'

puts "🌱 Seeding..."

puts "destroying all...."
Unit.destroy_all
MaintenanceRequest.destroy_all
Owner.destroy_all
puts "DESTROYED!"

puts "seeding owners..."
o1 = Owner.create(name: "Kyle Rieman", phone_number: Faker::PhoneNumber.cell_phone)

o2 = Owner.create(name: "Joe Decker", phone_number: Faker::PhoneNumber.cell_phone)

o3 = Owner.create(name: "Keith Strausser", phone_number: Faker::PhoneNumber.cell_phone)

o4 = Owner.create(name: "Clay Henry", phone_number: Faker::PhoneNumber.cell_phone)

o5 = Owner.create(name: "Bob Brady", phone_number: Faker::PhoneNumber.cell_phone)
puts "OWNERS seeded"

puts "seeding units..."
u1 = Unit.create(address: "123 Fake Street Columbia, MO 65203", current_tenant: "Jim Jones", open_request?: true, owner_id: o3.id) #

u2 = Unit.create(address: "4585 North Ave. Jefferson City, MO 65111", current_tenant: "Katy Katters", open_request?: false, owner_id: o2.id) #

u3 = Unit.create(address: "13898 SE Rollins Rd. Columbia, MO 65203", current_tenant: "Mike Meddler", open_request?: true, owner_id: o4.id)#

u4 = Unit.create(address: "411 River Rd. Rocheport, MO 65279", current_tenant: "Brian Bukowski", open_request?: false, owner_id: o5.id)

u5 = Unit.create(address: "666 Unlucky Ave. Jefferson City, MO 65111", current_tenant: "Jack Black", open_request?: false, owner_id: o2.id)

u6 = Unit.create(address: "1 Broadway Blvd. Unit 1 Columbia, MO 65201", current_tenant: "Timmy Taylor", open_request?: false, owner_id: o1.id)

u7 = Unit.create(address: "1 Broadway Blvd. Unit 2 Columbia, MO 65201", current_tenant: "Tammy Taylor", open_request?: true, owner_id: o1.id)

u8 = Unit.create(address: "420 Pleasant St. Columbia, MO 65203", current_tenant: "Bob Marley", open_request?: true, owner_id: o1.id)
puts 'UNITS seeded'

puts "seeding maintenance requests..."
m1 = MaintenanceRequest.create(urgency: "low", description: "back porch light not working", expected_cost: 150.35, actual_cost: 5.29, date_opened: "2023-05-17", date_closed: nil, unit_id: u1.id )#

m2 = MaintenanceRequest.create(urgency: "medium", description: "freezer not staying cold", expected_cost: 250.99, actual_cost: 752.36, date_opened: '2023-02-16', date_closed: '2023-02-17', unit_id: u2.id )#

m3 = MaintenanceRequest.create(urgency: "high", description: "front window glass broken", expected_cost: 100.01, actual_cost: 125.98, date_opened: '2022-12-09', date_closed: nil, unit_id: u3.id )#

m4 = MaintenanceRequest.create(urgency: "low", description: "lots of ants on back deck", expected_cost: 15.53, actual_cost: 15.50, date_opened: '2022-11-03', date_closed: nil, unit_id: u3.id )

m5 = MaintenanceRequest.create(urgency: "medium", description: "gfci outlet in bathroom keeps resetting", expected_cost: 20.00, actual_cost: 20.99, date_opened: '2022-12-26', date_closed: nil, unit_id: u2.id )

m6 = MaintenanceRequest.create(urgency: "high", description: "smoke coming from furnace", expected_cost: 500.69, actual_cost: 1385.69, date_opened: '2023-01-08', date_closed: nil, unit_id: u4.id)

m7 = MaintenanceRequest.create(urgency: "low", description: "critter scurrying sound coming from attic", expected_cost: 40.20, actual_cost: 20.02, date_opened: '2023-02-17', date_closed: '2023-02-19', unit_id: u5.id)

m8 = MaintenanceRequest.create(urgency: "medium", description: "front storm door off hinges", expected_cost: 60.33, actual_cost: 20.25, date_opened: '2023-03-17', date_closed: nil, unit_id: u5.id)
puts "MAINTENANCE REQS SEEDED"


puts "✅ Done seeding!"


#maintreq should be join table (belong to owner, belong to unit).  !!!!!  -scratch that!

#newmaintreq should have owner ID and unit ID. - review all seed data
    #unit needs owner ID

#going to have to review migrations, etc. in order to fix some things here. 

#date closed should be null on open reqs. this will be changed when the user marks as closed on the front end.

#as user, I am manager. first, i can see an overview of current units. 
    # - lets add in a column for owner name, to the right of Owner ID in units overview. 
    #from the unit overview, I can see which unit has an open request. 

    #full CRUD on maint reqs. update form to update actual cost, etc. dynamic form. 

#in open reqs, I can 
    #see all info about requests, inlcluding tenant and owner
    #delete a request (in case of mistake, etc.)
    #update the open request to closed - once this is done I should no longer see the request (as it has been marked closed) 

            #this means that open_req boolean needs to be in maintreq, not in unit.

        #update actual cost - we make note of expected cost while subbing form, and actual cost at time of closing the open request.


    #in all (past) requests, i can
        #see all requests, including those currently open and reqs that have been closed. 


    #lets add an owner overview as well. 