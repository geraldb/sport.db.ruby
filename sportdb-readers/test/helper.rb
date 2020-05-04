## note: use the local version of sportdb gems
$LOAD_PATH.unshift( File.expand_path( '../sportdb-formats/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sportdb-countries/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sportdb-leagues/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sportdb-teams/lib' ))

$LOAD_PATH.unshift( File.expand_path( '../sportdb-match-formats/lib' ))

$LOAD_PATH.unshift( File.expand_path( '../footballdb-leagues/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../footballdb-clubs/lib' ))

$LOAD_PATH.unshift( File.expand_path( '../sportdb-config/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sportdb-sync/lib' ))


## minitest setup
require 'minitest/autorun'



## our own code
require 'sportdb/readers'

## use (switch to) "external" datasets
SportDb::Import.config.leagues_dir = "../../../openfootball/leagues"
SportDb::Import.config.clubs_dir   = "../../../openfootball/clubs"


COUNTRIES = SportDb::Import.catalog.countries
LEAGUES   = SportDb::Import.catalog.leagues
CLUBS     = SportDb::Import.catalog.clubs
