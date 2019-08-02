BaseModel       = require 'shared/record_store/base_model'
AppConfig       = require 'shared/services/app_config'

module.exports = class BreakoutModel extends BaseModel
  @singular: 'breakout'
  @plural: 'breakouts'
  @indices: ['breakoutId', 'discussionId']
  @serializableAttributes: AppConfig.permittedParams.breakout

  defaultValues: ->
    discussionId: null

  relationships: ->
    @belongsTo 'discussion'
    @hasMany  'users'
    