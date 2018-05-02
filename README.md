[![Swift Version](https://img.shields.io/badge/Swift-4.1-brightgreen.svg)](https://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-3-brightgreen.svg)](https://vapor.codes)
[![Build Status](https://img.shields.io/circleci/project/github/gperdomor/storage-kit.svg)](https://circleci.com/gh/gperdomor/storage-kit)
[![codecov](https://codecov.io/gh/gperdomor/storage-kit/branch/master/graph/badge.svg)](https://codecov.io/gh/gperdomor/storage-kit)
[![GitHub license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)

# StorageKit

A protocol based storage framework to provide an easy way integrate and use third-party storage providers in Vapor.

Main goals:

* Provide a common way to manipulate files in your app without worry about the provider (local, S3, Azure, GCS).
* Allow users to switch between storage providers without (or minimal) changes to the source code of their apps.

## Available implementations

* [LocalStorage](https://github.com/gperdomor/local-storage)
* [S3Storage](https://github.com/anthonycastelli/s3-storage)


## Credits

This package is developed and maintained by [Gustavo Perdomo](https://github.com/gperdomor) with the collaboration of all vapor community.

## License

StorageKit is released under the [MIT License](LICENSE).
