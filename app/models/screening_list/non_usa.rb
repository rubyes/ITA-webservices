module ScreeningList
  class NonUsa
    include Indexable
    include ScreeningList::NonUsaMappable
    self.source = {
      full_name: 'Non US Restricted Party List',
      code:      'NON_USA',
    }
  end
end
