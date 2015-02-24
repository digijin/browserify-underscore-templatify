# browserify-underscore-templatify

Plugin for browserify to turn required html files into underscore templates.

Require html files directly from your javascript and use them as compiled templates.

In your browserify bundling code:

```javascript
browserify = require("browserify");
templatify = require("browserify-underscore-templatify");
bundler = new browserify();
bundler.transform(templatify());
bundler.bundle();
```
And then in your application:
```javascript
view = require("index.html");
return view(); //renders the view

```

### options

You can pass in an optional object defining the file extensions to look for when deciding if a file is a template or not:
```javascript
templatify({ext:['.us-templ']}); //default is ['.html']
```
