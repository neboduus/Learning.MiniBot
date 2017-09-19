class User < ApplicationRecord
  def set_state(state)
    self.state = state.to_json
    save
  end
end
