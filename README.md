# TrafficSourceParser

[![Code Climate](https://codeclimate.com/github/thiesen/traffic_source_parser/badges/gpa.svg)](https://codeclimate.com/github/thiesen/traffic_source_parser) [![Test Coverage](https://codeclimate.com/github/thiesen/traffic_source_parser/badges/coverage.svg)](https://codeclimate.com/github/thiesen/traffic_source_parser/coverage) [![Build Status](https://travis-ci.org/thiesen/traffic_source_parser.svg?branch=master)](https://travis-ci.org/thiesen/traffic_source_parser)

A parser to **TrafficSourceCookie**

WIP :pray:

## Usage

`parsed_source = TrafficSourceParser.parse(cookie_value)`

It sets `parsed_source` as a specific `TrafficSourceParser::Parser` object, with attributes defined by its type and cookie params.

#### Cookie value is **utmz**:

`#<TrafficSourceParser::Parser::UtmzParser::Utmz utmcsr="t.co", utmccn="(referral)", utmcmd="referral", utmcct="/EFzCFawFrk">`

#### Cookie value is **campaign**:

`#<TrafficSourceParser::Parser::CampaignParser::Campaign utm_campaign="spring", utm_medium="email", utm_source="newsletter1", utm_content="toplink">`

#### Cookie value is a **referrer**:

Referrer is a listed social network:

`#<TrafficSourceParser::Result::Social source="Facebook">`

Referrer is from a listed search engine:

`#<TrafficSourceParser::Result::Search source="Bing", query="shipit resultados digitais">`

Referrer is unknown

`#<TrafficSourceParser::Result::Generic source="http://www.resultadosdigitais.com.br">`
