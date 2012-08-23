[![build status](https://secure.travis-ci.org/selead/bm-generator.png)](http://travis-ci.org/selead/bm-generator)
# Bookmarklet project generator

Quick way to create bookmarklet from command line.

## Install via `npm`

Add `-g` for enable package shell command.

    ```bash
    npm install bm-genarator -g
    ```
    
## Usage

### Create project

  Go to target folder and type
  
    ```bash
    bm-generator myproject -u http://example.com/js/bm.js
    ```

  Set `-u` option to actual bookmarklet position
  
  File `bm.js.copy` will contain bookmarklet content that must be inserted 
  into browser's bookmarklets.

  Add options to extend functionality:
  
  -  `-z` - include zepto.js framework
  -  `-g` - enable git for project
  -  `-S` - path to Amazon S3 bucket and folder, where bookmarklet will putted.
            You'll need `s3cmd` for use this option.
  
### Use project
  
  Update bookmarklet.coffee and run
  
    ```bash
    ./generator
    ```
    
  This create bookmarklet file in `./out/bm.js`. Copy it to destignation.
  If `-S` option was set on creating project, bm.js will be pushed to Amazon S3.
  
## Licence

(The MIT License)

Copyright (c) 2012 Temnov Kirill <allselead@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
