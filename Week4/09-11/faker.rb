# frozen_string_literal: true

require 'faker'

# Config to get location in Vietnam
Faker::Config.locale = :vi

# Fake Name
Faker::Name.name             #=> "Harvey Morar"         (có tiếng việt)

Faker::Name.name_with_middle #=> "Aditya Elton Douglas" (có tiếng việt)

Faker::Name.first_name       #=> "Kaci"                 (có tiếng việt)

Faker::Name.middle_name      #=> "Abraham"              (có tiếng việt)

Faker::Name.male_first_name   #=> "Edward"

Faker::Name.female_first_name #=> "Natasha"

Faker::Name.last_name        #=> "Ernser"

Faker::Name.prefix           #=> "Mr."

Faker::Name.suffix           #=> "IV"

# Fake Address
Faker::Address.city        #=> "Hà Nam"                 (có tiếng việt)

Faker::Address.street_name #=> "Larkin Fork"

Faker::Address.street_address #=> "282 Kevin Brook"

Faker::Address.country #=> "French Guiana"

Faker::Address.full_address #=> "282 Kevin Brook, Imogeneborough, CA 58517"

# Fake string of aplabet and number
Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"

Faker::Alphanumeric.alphanumeric(number: 10) #=> "3yfq2phxtb"

Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) #=> "3yfq2phx8b"

# Fake Company
Faker::Company.name #=> "Hirthe-Ritchie"

Faker::Company.department #=> "Business Development"

# Fake Phonenumber
Faker::PhoneNumber.phone_number #=> "397.693.1309 x4321"    (co sdt vn)

# Fake University
Faker::University.name #=> "South Texas College"

# Fake Date
Faker::Date.between(from: '2014-09-23', to: '2014-09-25') #=> #<Date: 2014-09-24>

Faker::Date.forward(days: 23) # => "Fri, 03 Oct 2014"

Faker::Date.on_day_of_week_between(day: :tuesday, from: '2023-01-01', to: '2023-02-01') #=> "Tue, 10 Jan 2023"

Faker::Date.in_date_period(year: 2018, month: 2) #=> #<Date: 2018-02-26>

# Fake Hash
Faker::Types.rb_hash(number: 2) #=> {name: "bob", last: "marley"}

# Fake Word
Faker::Lorem.word    #=> "bàn"    (co tieng viet)
Faker::Lorem.word(exclude_words: ['cam', 'den'])
Faker::Lorem.words(number: 5) #=> ["mượn", "khoảng", "mướn", "á", "bơi"]    (co tieng viet)

# Fake Json
json = Faker::Json.shallow_json(width: 3, options: { key: 'Address.country', value: 'Address.city' })
json2 = Faker::Json.add_depth_to_json(json: json, width: 2, options: { key: 'Name.name', value: 'PhoneNumber.phone_number' })
puts json2
