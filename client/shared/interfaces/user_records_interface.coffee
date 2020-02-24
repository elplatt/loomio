BaseRecordsInterface = require 'shared/record_store/base_records_interface'
UserModel            = require 'shared/models/user_model'

module.exports = class UserRecordsInterface extends BaseRecordsInterface
  model: UserModel
  apiEndPoint: 'profile'

  fetchMentionable: (q, model) =>
    model = model.discussion() if !model.id? && model.discussionId
    model = model.group() if !model.id? && !model.discussionId
    @fetch
      path: 'mentionable_users'
      params:
        q: q
        "#{model.constructor.singular}_id": model.id

  updateProfile: (user) =>
    serialized = user.serialize()
    delete serialized['user']['discussion_stages']
    @remote.post 'update_profile', _.merge(serialized, {unsubscribe_token: user.unsubscribeToken })

  uploadAvatar: (file) =>
    @remote.upload 'upload_avatar', file

  changePassword: (user) =>
    serialized = user.serialize()
    delete serialized['user']['discussion_stages']
    @remote.post 'change_password', serialized

  deactivate: (user) =>
    @remote.post 'deactivate', user.serialize()

  destroy: => @remote.delete '/'

  reactivate: (user) =>
    @remote.post 'reactivate', user.serialize()

  saveExperience: (experience) =>
    @remote.post 'save_experience', experience: experience

  emailStatus: (email, token) ->
    @fetch
      path: 'email_status'
      params: _.pickBy({email: email, token: token}, _.identity)
