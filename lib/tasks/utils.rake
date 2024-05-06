namespace :utils do
  desc "Popular (preencher) banco de dados"
  task seed: :environment do
    puts "\nGerando os contatos (Contacts)..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.paragraph
        )
    end

    puts "\nGerando os endereços (Addresses)...\n"
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "\nGerando os endereços (Addresses)...[OK]\n"

    puts "Gerando Telefones (Phones)..."
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Gerando Telefones (Phones)...[OK]"
  end
end
