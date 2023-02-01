# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[read create edit update delete], Post, user: user.writer?
  end
end
