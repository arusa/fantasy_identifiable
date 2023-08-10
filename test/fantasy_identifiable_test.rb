require "test_helper"
require "fantasy_identifiable"

class FantasyIdentifiableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FantasyIdentifiable::VERSION
  end

  def test_fantasy_identifier_is_long_string
    test_object = FantasyObject.create
    assert test_object.identifier.instance_of?(String)
    assert test_object.identifier.length > 8
  end

  def test_friendly_identifier_is_long_string
    test_object = FriendlyObject.create
    assert test_object.identifier.instance_of?(String)
    assert test_object.identifier.length == 20
  end

  def test_uuid_identifier_is_long_string
    test_object = UuidObject.create
    assert test_object.identifier.instance_of?(String)
    assert test_object.identifier.count("-") == 4
  end

  def test_multiple_identifiers_in_one_model
    test_object = MultiObject.create
    assert test_object.identifier.instance_of?(String)
    assert test_object.identifier.count("-") == 4
    assert test_object.friendly_name.instance_of?(String)
    assert test_object.friendly_name.length == 20
  end

  def test_identifier_is_not_overwritten
    test_object = FriendlyObject.create(identifier: "test")
    assert test_object.identifier == "test"
  end
end
