# README

## API Overview
### Version
**1.0.0**

We have created three Objects
1. Users
2. Articles
3. Comments

##### Object:Users


| Field        | Type           | Description  |
| :-------------: |:-------------:| :--------------------:|
| username     | string | this is the username |
| name     | string      |   name of the user |
| email  | string      | email of the user |
| created_at  | date      | created_date of user |
| updated_at  | date      | updated_date of user |




##### Object:Articles

| Field        | Type           | Description  |
| :-------------: |:-------------:| :--------------------:|
| title     | string | title of the article  |
| body     | string      |   body of the article |
| user_id  | integer      | id of the user |
| created_at  | date      | created_date of article |
| updated_at  | date      | updated_date of article |

##### Object:comments

| Field        | Type           | Description  |
| :-------------: |:-------------:| :--------------------:|
| body     | text | body of the comment  |
| user_id  | integer      | id of the user |
|article_id | integer | id of the article |
| created_at  | date      | created_date of comment |
| updated_at  | date      | updated_date of comment |


application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
o get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Version
3.0.2

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [Marked] - a super fast port of Markdown to JavaScript
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [keymaster.js] - awesome keyboard handler lib by [@thomasfuchs]
* [jQuery] - duh

### Installation

You need Gulp installed globally:

```sh
$ npm i -g gulp
```

```sh
$ git clone [git-repo-url] dillinger
$ cd dillinger
$ npm i -d
$ mkdir -p public/files/{md,html,pdf}
$ gulp build --prod
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins

* Dropbox
* Github
* Google Drive
* OneDrive

Readmes, how to use them in your own application can be found here:

* [plugins/dropbox/README.md](https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md)
* [plugins/github/README.md](https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md)
* [plugins/googledrive/README.md](https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md)
* [plugins/onedrive/README.md](https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md)

### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantanously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma start
```

### Todo's

 - Write Tests
 - Rethink Github Save
 - Add Code Comments
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**

[john gruber]:http://daringfireball.net/
[@thomasfuchs]:http://twitter.com/thomasfuchs
[1]:http://daringfireball.net/projects/markdown/
[marked]:https://github.com/chjj/marked
[Ace Editor]:http://ace.ajax.org
[node.js]:http://nodejs.org
[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[keymaster.js]:https://github.com/madrobby/keymaster
[jQuery]:http://jquery.com
[@tjholowaychuk]:http://twitter.com/tjholowaychuk
[express]:http://expressjs.com
[AngularJS]:http://angularjs.org
[Gulp]:http://gulpjs.com
