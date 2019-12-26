# encoding: utf-8

require 'pp'
require 'time'
require 'date'

## 3rd party libs/gems
require 'logutils'


###
# our own code
require 'date-formats/version' # let version always go first
require 'date-formats/reader'
require 'date-formats/names'   ## month and day names (e.g. January,.. Monday,...)


module DateFormats

#############
# helpers for building format regex patterns
MONTH_EN       = build_names( MONTH_NAMES[:en] ) # e.g. Jan|Feb|March|Mar|April|Apr|May|June|Jun|...
DAY_EN         = build_names( DAY_NAMES[:en] )

MONTH_FR       = build_names( MONTH_NAMES[:fr] )
DAY_FR         = build_names( DAY_NAMES[:fr] )

MONTH_ES       = build_names( MONTH_NAMES[:es] )
DAY_ES         = build_names( DAY_NAMES[:es] )

MONTH_PT       = build_names( MONTH_NAMES[:pt] )
DAY_PT         = build_names( DAY_NAMES[:pt] )

MONTH_DE       = build_names( MONTH_NAMES[:de] )
DAY_DE         = build_names( DAY_NAMES[:de] )

MONTH_IT       = build_names( MONTH_NAMES[:it] )
DAY_IT         = build_names( DAY_NAMES[:it] )

end  # module DateFormats



require 'date-formats/formats'
require 'date-formats/parser'




puts DateFormats.banner   # say hello
