module ScreeningList
	module NonUsaMappable
		
		# include ScreeningList::Mappable
		def self.included(klass)
			
			klass.class_eval do
		      include ScreeningList::Mappable
		    end
    		
			klass.mappings[klass.name.typeize][:properties].merge!(
				{
					place_of_birth: 		{ type: 'text', fields: { keyword: { type: 'keyword', ignore_above: 256 } } },
					programs: 				{ type: 'text', fields: { keyword: { type: 'keyword', ignore_above: 256 } } },

					source_information_url: { type: 'text', fields: { keyword: { type: 'keyword', ignore_above: 256 } } },
					source_list_url: 		{ type: 'text', fields: { keyword: { type: 'keyword', ignore_above: 256 } } },
					source_agency_name: 	{type: "keyword"},
					source_list_full_name: 	{type: "keyword"},
					source_country_name: 	{type: "keyword"},

					contact_name: 			{type: "keyword"},
					ignored_party_flg: 		{type: "keyword"},
					oid_nbr: 				{type: "integer"},
					version_id_nbr: 		{type: "integer"},
				}
			)
		end
	end
end