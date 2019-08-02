BaseRecordsInterface = require 'shared/record_store/base_records_interface'
BreakoutModel         = require 'shared/models/breakout_model'

module.exports = class BreakoutRecordsInterface extends BaseRecordsInterface
  model: BreakoutModel
