require "fantasy_identifiable/version"
require "active_support/concern"
require "faker"

module FantasyIdentifiable
  # class Error < StandardError; end

  extend ::ActiveSupport::Concern

  included do
    # class << self; attr_reader :identifier_fields; end
    before_create :generate_identifiers
  end

  def generate_identifiers
    self.class.identifier_fields.each do |field_name, field_type|
      case field_type
      when :friendly
        set_friendly_identifier field_name
      when :fantasy
        set_fantasy_identifier field_name
      else
        set_uuid_identifier field_name
      end
    end
  end

  class_methods do
    attr_reader :identifier_fields

    def identifiable(fields)
      @identifier_fields = fields
    end
  end

  def identifier_with(field_name, &block)
    loop do
      new_id = block.call
      if self.class.where("#{field_name} LIKE ?", new_id).empty?
        send("#{field_name}=", new_id)
        break
      end
    end
  end

  def set_fantasy_identifier field_name
    identifier_with(field_name) do
      random_fantasy_identifier
    end
  end

  def set_friendly_identifier field_name
    identifier_with(field_name) do
      friendly_token(20).downcase.tr("-_", "ab")
    end
  end

  def set_uuid_identifier field_name
    identifier_with(field_name) do
      SecureRandom.uuid
    end
  end

  def friendly_token(length = 20)
    # To calculate real characters, we must perform this operation.
    # See SecureRandom.urlsafe_base64
    rlength = (length * 3) / 4
    SecureRandom.urlsafe_base64(rlength).tr('lIO0', 'sxyz')
  end

  def random_fantasy_identifier
    (
      (
        Faker::Hipster.words(number: 4) +
        [
          Faker::TvShows::Stargate.planet,
          Faker::TvShows::GameOfThrones.city,
          Faker::TvShows::GameOfThrones.dragon,
          Faker::Movies::HitchhikersGuideToTheGalaxy.planet,
          Faker::Creature::Animal.name,
          Faker::Creature::Cat.name,
          Faker::Creature::Dog.name,
          Faker::Fantasy::Tolkien.race,
          Faker::Books::Dune.city,
          Faker::Books::Dune.planet,
          Faker::Verb.past,
          Faker::Science.element,
          Faker::Name.first_name,
          Faker::Job.key_skill,
          Faker::Hacker.noun
        ]
      ).sample(3) +
      [friendly_token(3).downcase.tr("-_", "ab")]
    ).join("-").delete(" ").downcase.gsub(/[^\-0-9A-Za-z]/, '')
  end
end
