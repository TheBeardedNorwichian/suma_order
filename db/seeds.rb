require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    CSV.foreach('db/CurrentSumaPrices.csv', headers: true) do |row|
      BaseData.create!(row.to_hash)
    end

    BaseData.all.each do |x|
      Item.create!(id: x.id, code: x.code, description: x.description,
                  details: x.details, size: x.size, 
                  rrp: (x.rrp == nil ? nil : (x.rrp * 100).to_i), price: (x.price * 100).to_i)
    end

    BaseData.select("DISTINCT category_name").map(&:category_name).sort.each do |x|
      Category.create!(category: x)
    end

    BaseData.select("DISTINCT brand").where("brand IS NOT NULL").map(&:brand).sort.each do |x|
      Brand.create!(brand: x)
    end


