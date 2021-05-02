class FantasyObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({ identifier: :fantasy })
end

class FriendlyObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({ identifier: :friendly })
end

class UuidObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({ identifier: :uuid })
end

class MultiObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({
    friendly_name: :friendly,
    identifier: :uuid
  })
end
