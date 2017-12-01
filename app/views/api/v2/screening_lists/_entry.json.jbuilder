type = entry[:_source][:type].casecmp('vessel').zero? ? 'vessel' : 'default'
json.partial! "api/v2/screening_lists/non_us_rpl/#{type}/entry", entry: entry
