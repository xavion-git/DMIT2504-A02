# DMIT2504 – Futures and JSON Exercise

## Description

Create a Dart console application that will submit a request for word definition data at the published endpoint. The returned data should be displayed in a simple format on the console. For example:

```
Word            Definition
--------------  ---------------------------------------------------
Vernacular      The language of a people or a national language.
```

## Requirements

- Prompt the user for the word they would like to search for
- Append the word entered by the user to the end of the endpoint URL (see the endpoint documentation) and send the request for the data
- Upon return, parse the data correctly to obtain the first definition for the word (see the sample output above)
  - **NOTE:** you only need to display the first returned definition
- Continue to allow the user to search for words until they choose to quit the program
- **OPTIONAL:** you may want to create a class to represent the returned word data object

The endpoint and documentation can be found here: [https://dictionaryapi.dev/](https://dictionaryapi.dev/)