## [0.0.1] - TODO: Add release date.

* Testing some features to fetch API response
  
## [0.0.4] - makes some changes to access the methods

```dart
  var response = await jsonHandler.getData('https://jsonkeeper.com/b/DNP6');
```

## [0.0.5] - the getData method now accepts header and also handles exceptions

```dart
  var data = await jsonHandler.getData(
    url: demoUrl, 
    header: {'Accept': 'application/json'});
```