#Lesson 3 :books:

### Requirements
1. Open config.json file
2. Set the host and bucket name as follows: 
3. Run your couchbase server
```
    {
        "host":   "localhost"
        "bucket": "[your bucket name]"
    }
```

### Objective: use odme to create model

- Use [odme](http://tectual.github.io/odme/index.html) to create User model. Same as previous sample calling:
    - `coffee cb.coffee save -n=arash -a=33`
        - Should create a user document with random key (odme use shortID to generate it) and content of  { name: ‘arash’, age: 33 }
    - `coffee cb.coffee get --name=DOCUMENT_KEY`
        - Should get the document and log the content in console.
