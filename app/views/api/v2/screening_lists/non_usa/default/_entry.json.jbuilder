json.partial! 'api/v2/screening_lists/addresses', addresses: entry[:_source][:addresses]
              

_source = entry[:_source]

json.alt_names	_source[:alt_names]
json.name	_source[:name]
json.source_country_nm	_source[:source_country_nm]
json.source_agency_nm	_source[:source_agency_nm]

json.source entry[:_source].try(:[],:source).try(:[],:full_name)

json.source_list_url _source[:source_list_url]
json.type _source[:type]


# json.call(entry[:_source],
#           :alt_names,
#           :name,
#           :source_country_nm,
#           :source_agency_nm
#          )
# json.call(entry[:_source],
#           :source_list_url,
#           :type,
#          )