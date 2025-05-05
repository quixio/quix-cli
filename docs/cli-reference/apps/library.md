{% include-markdown './library.gen.md' %}

## Sample Usage

### Listing All Library Items

To view all available apps in the library:

```bash
$ quix app lib
```

Sample output:

```
| Id                   | Name                 | Description             | Tags              |
| -------------------- | -------------------- | ----------------------- | ----------------- |
| kafka-connect-source | Kafka Connect Source | Install a Kafka Connect | Advanced, Source, |
|                      |                      | source connector in the | Connectors, Kafka |
|                      |                      | Quix platform           |                   |
```

### Searching the Library

To search for items containing the term `dashb`, run:

```bash
$ quix app lib -s dashb
```

Sample output:

```
| Id        | Name                | Description                            | Tags                              |
| --------- | ------------------- | -------------------------------------- | --------------------------------- |
| streamlit | Streamlit dashboard | Run a Streamlit real-time dashboard    | Medium, QuixStreams, Destination, |
|           |                     | that displays data from a Kafka topic. | Streamlit                         |
```

!!! tip
    Use the search option to quickly find relevant items by name or description.

### Filtering by Tags

To filter library items by tag, such as `Easy`:

```bash
$ quix app lib --tags Easy
```

Sample output:

```
| Id                      | Name            | Description              | Tags                                    |
| ----------------------- | --------------- | ------------------------ | --------------------------------------- |
| nodejs-starter-template | Sample template | A template for Quix Code | Easy, Basic templates, Samples, Node.js |
|                         |                 | applications             |                                         |
```

!!! tip "Create a New App"
    To create a new app from a library item, run:

    ```bash
    quix app add [library-item-id]
    ```