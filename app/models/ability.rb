# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    reader_abilities
    writer_abilities
    editor_abilities

    if user.writer?
      writer_abilities
    elsif user.editor?
      editor_abilities
    else
      reader_abilities
    end

  end

  private 

  def reader_abilities
    can :read, Post
  end

  def writer_abilities
    can :update, Post, user: Current.user
    can :create, Post
    cannot :destroy, Post
  end

  def editor_abilities
    cannot :create, Post # an editor role cannot create a post
    can :update, Post # an editor can update any post
  end

end
