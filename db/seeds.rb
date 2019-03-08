# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
require 'faker'

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_quotes
  end

  def generate_quotes
    20.times do |i|
      author =
      quote = Quote.create!(
        author: Faker::Book.author,
        content: Faker::ChuckNorris.fact
      )
      puts "Quote #{i}: Author is #{quote.author} and quotation is '#{quote.content}'."
    end
  end
end

Seed.begin
