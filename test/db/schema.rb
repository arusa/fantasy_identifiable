ActiveRecord::Schema.define do
  self.verbose = false

  create_table :fantasy_objects, force: true do |t|
    t.string :identifier
  end

  create_table :friendly_objects, force: true do |t|
    t.string :identifier
  end

  create_table :uuid_objects, force: true do |t|
    t.string :identifier
  end

  create_table :multi_objects, force: true do |t|
    t.string :identifier
    t.string :friendly_name
  end
end
