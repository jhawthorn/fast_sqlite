# FastSqlite

Makes sqlite faster... but at what cost?

(The cost is data integrity :bomb:)

## K, what's it actually do?

It modifies following two sqlite settings on newly opened connections

    PRAGMA synchronous = 0;

> If the application running SQLite crashes, the data will be safe, but the database might become corrupted if the operating system crashes or the computer loses power before that data has been written to the disk surface. On the other hand, some operations are as much as 50 or more times faster with synchronous OFF.

\- [SQLite docs](http://www.sqlite.org/pragma.html#pragma_synchronous)


    PRAGMA journal_mode = MEMORY;

> The MEMORY journaling mode stores the rollback journal in volatile RAM. This saves disk I/O but at the expense of database safety and integrity. If the application using SQLite crashes in the middle of a transaction when the MEMORY journaling mode is set, then the database file will very likely go corrupt.

\- [SQLite docs](http://www.sqlite.org/pragma.html#pragma_journal_mode)

These settings are dangerous. Making this only suitable for test environments.

## Installation

Add this line to your application's Gemfile:

    gem 'fast_sqlite', group: :test

And then execute:

    $ bundle

## Contributing

1. Fork it ( http://github.com/jhawthorn/fast_sqlite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
