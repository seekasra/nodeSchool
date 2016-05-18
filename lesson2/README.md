#Lesson 2 :books:

### Requirements
1. Open config.json file
2. Set the host, port and bucket name as follows: 
```
    {
      "host":   "localhost"
      "port":   "[your port number]"
      "bucket": "[your bucket name]"
    }
```
3. Run your couchbase server

### Objective: work with couchbase

- Create a file named cb.coffee to get params from command line using [yargs](https://www.npmjs.com/package/yargs) and store data in [couchbase](https://www.npmjs.com/package/couchbase) or get data from it. 
- It should understand these commands:
    - `coffee cb.coffee save -n=arash -a=33`
        - This will create a document in couchbase with arash as key and store { name: ‘arash’, age: 33 } in it.
    - `coffee cb.coffee get --name=arash`
        - This will get the **arash** document from couchbase if it exist and print out the content of document in the console.
