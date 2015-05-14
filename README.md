# Statistik

A ruby wrapper to AppProva Statistics API: http://docs.appprovastatistics.apiary.io/

## Installation

Add this line to your application's Gemfile:

    gem 'statistik', source: 'https://tEc22xsAZEVZqYgY3xDz@repo.fury.io/appprova/'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install statistik --source https://tEc22xsAZEVZqYgY3xDz@repo.fury.io/appprova/

## Usage

To use Statistics gem you will need to configure the URL to Statistics API:

    Statistik.config do |config|
      config.url     = 'http://statistics.enem.appprova.com.br'
      config.version = '1.0'
    end

### Get Mock Statistics

Get Mock Statistics identified by it ids.

    Statistik::Mock.find(111)

To get the Mock Statistics from a determinated school and its comparison

    Statistik::Mock.find(111, query: {school_id: 222})

### Get Mock User Statistics 

Get Mock Statistics from a specific User

    Statistik::MockUser.find(111, 333)

### Get Mock Question Statistics

Get Question statistic of a determinated Mock

    Statistik::MockQuestion.find(111, 444)

To get the Mock Question Statistics from a determinated school and its comparison

    Statistik::MockQuestion.find(111, 444, query: {school_id: 222})

### Get Mock Alternative Statistics 

Get Alternative statistics of a determinated Mock

    Statistik::MockQuestion.find(111, 555)

To get the Mock Alternative Statistics from a determinated school and its comparison

    Statistik::MockQuestion.find(111, 555, query: {school_id: 222})