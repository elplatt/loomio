Records         = require 'shared/services/records'
RecordLoader    = require 'shared/services/record_loader'
BaseEventWindow = require 'shared/services/base_event_window'

module.exports = class NestedEventWindow extends BaseEventWindow
  constructor: ({discussion, breakout_id, parentEvent, initialSequenceId, per}) ->
    super(discussion: discussion, per: per)
    @columnName = "position"
    @parentEvent = parentEvent
    @initialSequenceId = initialSequenceId
    @setMin(@positionFromSequenceId() || @firstLoaded())
    @setMax(@lastLoaded() || false)
    @loader = new RecordLoader
      collection: 'events'
      params:
        discussion_id: @discussion.id
        breakout_id: breakout_id
        parent_id: @parentEvent.id
        order: 'position'
        per: @per

  positionFromSequenceId: ->
    initialEvent = Records.events.find(discussionId: @discussion.id, sequenceId: @initialSequenceId)[0]
    # ensure that we set the min position of the window to bring the initialSequenceId to the top
    # if this is the outside window, then the initialEvent might be nested, in which case, position to the parent of initialEvent
    # if the initialEvent is not child of our parentEvent

    # if the initialEvent is a child of the parentEvent then min = initialEvent.position
    # if the initialEvent is a grandchild of the parentEvent then min = initialEvent.parent().position
    # if the initialEvent is not a child or grandchild, then min = 0
    return 0 if ((initialEvent == undefined) || (@parentEvent == undefined))

    if initialEvent.parentId == @parentEvent.id
      initialEvent.position
    else if initialEvent.parent().parentId == @parentEvent.id
      initialEvent.parent().position
    else
      0

  useNesting: true

  # first, last, total are the values we actually have - within the window
  numTotal:        -> @parentEvent.childCount
  firstInSequence: -> 1
  lastInSequence:  -> @parentEvent.childCount

  eventsQuery: ->
    Records.events.collection.chain().find(parentId: @parentEvent.id)

  loadedEvents: ->
    @eventsQuery().simplesort('position').data()

  # windowed Events
  windowedEvents: ->
# For some reason, this query excludes new comments until a user refreshes the page.
# @max doesn't seem to be updated by the client js when a new comment is added
# NetDelib fork doesn't need to limit this query anyway.
#    query =
#      position:
#        $between: [@min, (@max || Number.MAX_VALUE)]
#    events = @eventsQuery().find(query).simplesort('position').data()
    events = @eventsQuery().simplesort('position').data()
    events
