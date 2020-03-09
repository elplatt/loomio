class BreakoutSerializer < ActiveModel::Serializer

  has_one :discussion, serializer: DiscussionSerializer, root: :discussions

  embed :ids, include: true
  attributes :id, :prime, :group, :remainder, :stage, :treatment

end
