class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment

    return unless user.present?

    if user.admin?
      can :destroy, Post
      can :destroy, Comment
    else
      can :destroy, Post do |post|
        post.author == user || user.admin?
      end
      can :destroy, Comment, author_id: user.id
    end
  end
end
