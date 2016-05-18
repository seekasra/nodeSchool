#Lesson 1 :books:

### Objective: learn hapiJS

- Open [Hapijs](http://hapijs.com/) and read all tutorials and create an API to do these:
  - If user call **GET /hello/{name}** it should say **“Hello NAME”** (eg. /hello/arash should return “Hello arash”).
  - Use [lout](https://github.com/hapijs/lout) to generate documentation.
  - Create a server method named **“sayhi(name)”** which concatenate hello with input parameter and return “hello NAME” (eg. sayhi(‘arash’) should return “Hello arash”). Your handler for GET /hello/{name} should use this server method to say hi.
  - Calling **GET /{name}** should load a page which says **Hello Name** in html (e.g. /arash should load a page saying “Hello arash”).
