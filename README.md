<!-- 
    Developer: Sven Kirtz
    Github: https://github.com/svki0001
-->

<p align="center">
  <a href="https://pub.dev/packages/pod_player"><img src="https://img.shields.io/pub/v/dorm_client?style=flat" alt="pub version"></a>
</p>

A Dart client for interacting with DORM APIs.

## Features

The DORM Dart Client provides easy-to-use classes for interacting with DORM API. It allows developers to map their database tables to Dart classes, and then perform CRUD operations on those classes, which are automatically translated into corresponding SQL statements.

The DORM supports a variety of databases, including MySQL and MSSQL. It provides a flexible and extensible architecture that allows developers to perform operations on databases and provides an API.

You can learn more about the DORM on its [repository](https://github.com/karolisdailidonis/DORM).

## Usage

Import the ``dorm_client`` package in your Dart file:

```Dart
import 'package:dorm_client/dorm_client.dart';
```

To use the DORM Client, you need to have a class that represents the table in the database. For example, let's say we have a table named "profile" with two columns "id" and "name", we would create a Dart class named "Profile" like this:

```Dart
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  static final String tableName = "profile";

  final String id;
  final String name;

  Profile({
    required this.id,
    required this.name,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  String toString() {
    return "$id: $name";
  }
}
```

Next, create an instance of the ``DORM`` class, passing in the schema version, API URL, and token as arguments:

```Dart
DORMRequest request = DORMRequest().addRead(
    from: Profile.tableName,
);

DORMResponse response = await _dorm.post(request);
```

The ``post`` method returns a ``DORMResponse`` object, which contains the response from the API. You can extract the rows from the response using the rows method, passing in a function to parse the JSON data into a Profile object:

```Dart
List<Profile>? profiles = response.rows(
  Profile.tableName,
  (json) => Profile.fromJson(json),
);
```

Finally, you can manipulate the retrieved data as desired.


## Classes

### DORM
The `DORM` class is a client for communicating with a DORM server API. It uses the Dio library to make HTTP requests to the server.

#### Constructor

The DORM class has a constructor that takes three required parameters:

- `schema`: the version of the DORM API being used.
- `url`: the URL of the DORM API location.
- `token`: the authentication token used to access the DORM API.

#### Methods
##### ``postRaw``

```dart
Future<Response> postRaw(DORMRequest request) async
```

This method sends a POST request to the DORM API.

It takes a single parameter, request, which is an instance of the ``DORMRequest`` class.

It returns a ``Future<Response>`` object representing the raw response from the server.

If an error occurs while making the request, a ``DROMServerException`` is thrown with an appropriate error message.

##### ``post``

```dart
Future<DORMResponse> post(DORMRequest request) async
```

This method sends a POST request to the DORM API and returns a ``DORMResponse`` object.

It takes a single parameter, request, which is an instance of the ``DORMRequest`` class.

If the server responds with an error message, a ``DROMServerException`` is thrown with an appropriate error message.

If an error occurs while parsing the response, a ``DROMClientException`` is thrown with an appropriate error message.

### DORMRequest

This class represents a request containing multiple jobs that can be sent to a database using the DORM library. A ``DORMRequest`` consists of one or more ``DORMJobs``.

#### Properties
- ``jobs``: A List of ``DORMJobs``

#### Methods
- ``add(DORMJob job)``: Adds a ``DORMJob`` to the jobs list and returns the ``DORMRequest`` object.
- ``addRead({from, columns, where, join})``: Creates a new ``DORMRead`` object with the provided parameters, adds it to the jobs list, and returns the ``DORMRequest`` object.
- ``addInsert({from, values, before})``: Creates a new ``DORMInsert`` object with the provided parameters, adds it to the jobs list, and returns the ``DORMRequest`` object.
- ``addUpdate({from, values, where})``: Creates a new ``DORMUpdate`` object with the provided parameters, adds it to the jobs list, and returns the ``DORMRequest`` object.
- ``toJson()``: Converts the jobs list to a List of ``Map`` and returns it.

### DORMRead
This class represents a read job to be executed on a database.

#### Properties
- ``columns``: An optional List of ``DORMColumn`` objects that specifies which columns to include in the result.
- ``where``: An optional List of ``DORMWhere`` objects that specifies the conditions to filter the result.
- ``join``: An optional ``DORMJoin`` object that specifies a join to perform.
- ``op``: An optional String that specifies an 'OR', 'AND' or 'BETWEEN' operator.
- ``val1``: An optional String that specifies the first value for ranges like 'BETWEEN'.
- ``val2``: An optional String that specifies the second value for ranges like 'BETWEEN'.


#### Methods
- ``toJson()``: Converts the job to a ``Map`` and returns it.

### DORMUpdate

This class represents an update job to be executed on a database.

#### Properties

- ``values``: A List of ``DORMValue`` objects that specifies the values to update.
- ``where``: An optional List of ``DORMWhere`` objects that specifies the conditions to filter the rows to update.

#### Methods
- ``toJson()``: Converts the job to a ``Map`` and returns it.

### DORMDelete
This class represents a delete job to be executed on a database.

#### Properties

- ``where``: An optional List of ``DORMWhere`` objects that specifies the conditions to filter the rows to delete.

#### Methods
- ``toJson()``: Converts the job to a ``Map`` and returns it.

### DORMColumn
This class represents a column in a ``DORMRead`` job.
#### Properties
- ``column``: A String that specifies the name of the column.

#### Methods
- ``toJson()``: Converts the column to a ``Map`` and returns it.

### DORMWhere

The ``DORMWhere`` class represents a condition to filter the results of a query. 

#### Properties
- ``column``: A string that represents the name of the column to compare.
- ``value``: A value that represents the value to compare against.
- ``condition``: A string that represents the condition to use in the comparison.

#### Methods
- ``toJson()``: Converts the condition to a ``Map`` and returns it.

### DORMValue

The ``DORMValue`` class represents a value to insert or update in a table.

#### Properties
- ``columnName``: the name of the column to insert or update.
- ``value``: the value to insert or update.

#### Methods
- ``toJson()``: Converts the value to a ``Map`` and returns it.

### DORMBefore

The ``DORMBefore`` class represents a before operation to perform before inserting a new row into a table.

#### Properties
- ``lastInsertId``: An object of type ``DORMLastInsertId`` that stores the value of the last inserted row ID in the database.

#### Methods
- ``toJson()``: Converts the operation to a ``Map`` and returns it.

### DORMLastInsertId

This class represents the last insert ID in a database table. It contains information about the table from which the ID was generated and the column in that table where it was set.

#### Properties
- ``fromTable``: the name of the table from which the last insert ID was generated.
- ``setColumn``: the name of the column in the table where the last insert ID was set.

#### Methods
- ``toJson()``: Converts the ID to a ``Map`` and returns it.

### DORMJoin

The ``DORMJoin`` class represents a join operation in the database. It contains a map of column names and their corresponding values to be used in the join query.

#### Properties
- ``jobsColumns``: A map of column names and their corresponding values to be used in the join query.

#### Methods
- ``toJson()``: Converts the operation to a ``Map`` and returns it.

## Additional information

Please support the development of this client as well the DORM itself.
